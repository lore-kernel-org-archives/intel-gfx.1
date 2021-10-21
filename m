Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E10FC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF3060E74
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FF3060E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFCA6EC62;
	Thu, 21 Oct 2021 10:36:29 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915CF6EC3F;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 21 Oct 2021 12:35:57 +0200
Message-Id: <20211021103605.735002-20-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 20/28] drm/i915: Ensure i915_vma tests do not
 get -ENOSPC with the locking changes.
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Now that we require locking to evict, multiple vmas from the same object
might not be evicted. This is expected and required, because execbuf will
move to short-term pinning by using the lock only. This will cause these
tests to fail, because they create a ton of vma's for the same object.

Unbind manually to prevent spurious -ENOSPC in those mock tests.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 1f10fe36619b..5c5809dfe9b2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -691,7 +691,11 @@ static int igt_vma_rotate_remap(void *arg)
 					}
 
 					i915_vma_unpin(vma);
-
+					err = i915_vma_unbind(vma);
+					if (err) {
+						pr_err("Unbinding returned %i\n", err);
+						goto out_object;
+					}
 					cond_resched();
 				}
 			}
@@ -848,6 +852,11 @@ static int igt_vma_partial(void *arg)
 
 				i915_vma_unpin(vma);
 				nvma++;
+				err = i915_vma_unbind(vma);
+				if (err) {
+					pr_err("Unbinding returned %i\n", err);
+					goto out_object;
+				}
 
 				cond_resched();
 			}
@@ -882,6 +891,12 @@ static int igt_vma_partial(void *arg)
 
 		i915_vma_unpin(vma);
 
+		err = i915_vma_unbind(vma);
+		if (err) {
+			pr_err("Unbinding returned %i\n", err);
+			goto out_object;
+		}
+
 		count = 0;
 		list_for_each_entry(vma, &obj->vma.list, obj_link)
 			count++;
-- 
2.33.0

