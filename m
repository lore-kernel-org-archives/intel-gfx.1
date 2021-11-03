Return-Path: <SRS0=D79Q=PW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A51C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 17:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0447761073
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Nov 2021 17:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0447761073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1735473C65;
	Wed,  3 Nov 2021 17:07:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3C73C61;
 Wed,  3 Nov 2021 17:07:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231501436"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="231501436"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 10:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="449892032"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 03 Nov 2021 10:04:50 -0700
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Date: Wed,  3 Nov 2021 10:04:43 -0700
Message-Id: <20211103170449.1614314-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
References: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 i-g-t 2/8] tests/i915/gem_exec_capture: Cope
 with larger page sizes
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
Cc: Intel-GFX@Lists.FreeDesktop.Org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

At some point, larger than 4KB page sizes were added to the i915
driver. This included adding an informational line to the buffer
entries in error capture logs. However, the error capture test was not
updated to skip this string, thus it would silently abort processing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_exec_capture.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 53649cdb2..47ca64dd6 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -484,6 +484,12 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 		addr |= strtoul(str + 1, &str, 16);
 		igt_assert(*str++ == '\n');
 
+		/* gtt_page_sizes = 0x00010000 */
+		if (strncmp(str, "gtt_page_sizes = 0x", 19) == 0) {
+			str += 19 + 8;
+			igt_assert(*str++ == '\n');
+		}
+
 		if (!(*str == ':' || *str == '~'))
 			continue;
 
-- 
2.25.1

