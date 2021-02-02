Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1667C433E6
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 21:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA9664F61
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 21:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA9664F61
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01246E0A2;
	Tue,  2 Feb 2021 21:20:18 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3626E0A2
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 21:20:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23777329-1500050 
 for <intel-gfx@lists.freedesktop.org>; Tue, 02 Feb 2021 21:20:10 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  2 Feb 2021 21:20:10 +0000
Message-Id: <20210202212011.28814-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202212011.28814-1-chris@chris-wilson.co.uk>
References: <20210202212011.28814-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 2/3] drm-tip: 2021y-02m-02d-12h-50m-06s UTC
 integration manifest
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

---
 integration-manifest | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 integration-manifest

diff --git a/integration-manifest b/integration-manifest
new file mode 100644
index 000000000000..d80099bceaa5
--- /dev/null
+++ b/integration-manifest
@@ -0,0 +1,40 @@
+drm drm-fixes e0ecafede87eb1a3d1e708f0365fad0d59489285
+	Merge tag 'amd-drm-fixes-5.11-2021-01-28' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
+drm-misc drm-misc-fixes 2b1b3e544f65f40df5eef99753e460a127910479
+	drm/ttm: Use __GFP_NOWARN for huge pages in ttm_pool_alloc_page
+drm-intel drm-intel-fixes 71a480f455c59041af65b31fa919fc19ce9f9bac
+	*** HAX FOR CI *** Revert "rtc: mc146818: Detect and handle broken RTCs"
+drm-amd drm-amd-fixes 2b702e72e33bbdec0764cfb6e1dd00fe1142ae55
+	Merge tag 'drm-misc-fixes-2017-09-28-1' of git://anongit.freedesktop.org/git/drm-misc into drm-fixes
+drm drm-next af2922fa158eccf0b1534bad5375cee62a622a4a
+	Merge branch 'linux-5.12' of git://github.com/skeggsb/linux into drm-next
+drm-misc drm-misc-next-fixes be3e477effba636ad25dcd244db264c6cd5c1f36
+	drm/komeda: Fix bit check to import to value of proper type
+drm-intel drm-intel-next-fixes 046f70d31ddb2069941aec54966fec5b7fbc7b7b
+	drm/i915/tgl: Fix REVID macros for TGL to fetch correct stepping
+drm-amd drm-amd-next-fixes 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e
+	Linux 4.14-rc1
+drm-misc drm-misc-next 576a08e008e2e3ed7c7ff3d96b3e813f5fdb2b5e
+	drm/v3d/v3d_sched: fix scheduler callbacks return status
+drm-intel drm-intel-next eaf9a3465d9b1fd1dc5a9a151380d84ac3789964
+	Merge tag 'topic/drm-device-pdev-2021-02-02' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next
+drm-intel drm-intel-next-queued 9d8fddf8579a2a20d0e8a8b631547069a62b953e
+	drm/i915: Disable outputs during unregister
+drm-amd drm-amd-next 754270c7c56292e97d0eff924a5d5d83f92add07
+	Merge branch 'drm-next-4.15' of git://people.freedesktop.org/~agd5f/linux into drm-next
+sound-upstream for-linus 4841b8e6318a7f0ae57c4e5ec09032ea057c97a8
+	ALSA: hda/realtek: modify EAPD in the ALC886
+sound-upstream for-next 2d670ea2bd53a9792f453bb5b97cb8ef695988ff
+	ALSA: jack: implement software jack injection via debugfs
+drm-intel topic/core-for-CI be9bde5a8b7b5cff58bd01c8ca094d571295c40b
+	Revert "rtc: mc146818: Detect and handle broken RTCs"
+drm-intel drm-intel-gt-next 3f33625866cb8fe0a2f08dfac9e339ccb12c6682
+	Merge tag 'topic/drm-device-pdev-2021-02-02' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next
+drm topic/iomem-mmap-vs-gup 74b30195395c406c787280a77ae55aed82dbbfc7
+	sysfs: Support zapping of binary attr mmaps
+drm topic/nouveau-ampere-modeset 584265dfec70e78ce2085b82ed389f27e06fbca0
+	Merge branch '04.01-ampere-lite' of git://github.com/skeggsb/linux into topic/nouveau-ampere-modeset
+drm-intel topic/adl-s-enabling 4043277ad18fc7cb9a79d0d043063fb5f42a6f06
+	drm/i915/adl_s: Add GT and CTX WAs for ADL-S
+drm-intel topic/drm-device-pdev 9ff06c38530099b197b6389193e8cc34ab60288f
+	drm/i915/gvt: Remove references to struct drm_device.pdev
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
