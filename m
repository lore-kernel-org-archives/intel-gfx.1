Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60143C433ED
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 06:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C951B6112D
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 06:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C951B6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B45F6EC9F;
	Thu,  6 May 2021 06:57:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40816EC9F;
 Thu,  6 May 2021 06:57:45 +0000 (UTC)
IronPort-SDR: YYB/Gei1vtWoAmiJPdATvjQ5sXEDgaiC/3wwcn2hkaBpA1gbr0ttWFNDFi9oUFi1lG9yhXDQOS
 6bZVokFK2Azg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="219273608"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="219273608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 23:57:45 -0700
IronPort-SDR: dDRA7dED3qAm5xv3+NU3lY0Pm/Z/SCY48oE+UdE3Q8LLSBiJNsvyqbfrWYObUBevi2rABu2tGe
 aBoUWfNBsTHg==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="434206271"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.12.210])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 23:57:42 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 May 2021 08:57:09 +0200
Message-Id: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v4] lib/i915/perf: Fix non-card0 processing
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

IGT i915/perf library functions now always operate on sysfs perf
attributes of card0 device node, no matter which DRM device fd a user
passes.  The intention was to always switch to primary device node if
a user passes a render device node fd, but that breaks handling of
non-card0 devices.

If a user passed a render device node fd, find a primary device node of
the same device and use it instead of forcibly using the primary device
with minor number 0 when opening the device sysfs area.

v2: Don't assume primary minor matches render minor with masked type.
v3: Reset sysfs dir fd if no match, consequently spell out error paths,
    add a comment on convertion of renderD* to cardX (Lionel).
v4: Limit primary lookup to minors <64 (Chris)

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com> # v3
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/perf.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 56d5c0b3a..5644a3469 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -372,14 +372,43 @@ open_master_sysfs_dir(int drm_fd)
 {
 	char path[128];
 	struct stat st;
+	int sysfs;
 
 	if (fstat(drm_fd, &st) || !S_ISCHR(st.st_mode))
                 return -1;
 
-        snprintf(path, sizeof(path), "/sys/dev/char/%d:0",
-                 major(st.st_rdev));
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", major(st.st_rdev), minor(st.st_rdev));
+	sysfs = open(path, O_DIRECTORY);
+	if (sysfs < 0)
+		return sysfs;
 
-	return open(path, O_DIRECTORY);
+	if (minor(st.st_rdev) >= 128) {
+		/* If we were given a renderD* drm_fd, find it's associated cardX node. */
+		char device[100], cmp[100];
+		int device_len, cmp_len, i;
+
+		device_len = readlinkat(sysfs, "device", device, sizeof(device));
+		close(sysfs);
+		if (device_len < 0)
+			return device_len;
+
+		for (i = 0; i < 64; i++) {
+
+			snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", major(st.st_rdev), i);
+			sysfs = open(path, O_DIRECTORY);
+			if (sysfs < 0)
+				continue;
+
+			cmp_len = readlinkat(sysfs, "device", cmp, sizeof(cmp));
+			if (cmp_len == device_len && !memcmp(cmp, device, cmp_len))
+				break;
+
+			close(sysfs);
+			sysfs = -1;
+		}
+	}
+
+	return sysfs;
 }
 
 struct intel_perf *
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
