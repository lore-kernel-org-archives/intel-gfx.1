Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A5DC63777
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 00:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4EA206ED
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 00:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4EA206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A74689D67;
	Tue,  1 Dec 2020 00:04:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98C5B89D67;
 Tue,  1 Dec 2020 00:04:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 909F5A9A42;
 Tue,  1 Dec 2020 00:04:08 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Date: Tue, 01 Dec 2020 00:04:08 -0000
Message-ID: <160678104858.6991.7289880634624956711@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201130204738.2443-1-uma.shankar@intel.com>
In-Reply-To: <20201130204738.2443-1-uma.shankar@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Enable_HDR_on_MCA_LSPCON_based_Gen9_devices_=28rev15=29?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Enable HDR on MCA LSPCON based Gen9 devices (rev15)
URL   : https://patchwork.freedesktop.org/series/68081/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
de078fd83295 drm/i915/display: Add HDR Capability detection for LSPCON
8a7c6f1ebb7f drm/i915/display: Enable HDR on gen9 devices with MCA Lspcon
cc5c32212d82 drm/i915/display: Attach HDR property for capable Gen9 devices
-:58: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_dp.c:6804:
+						   connector->dev->mode_config.hdr_output_metadata_property,

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
1810b71ee5e5 drm/i915/display: Fixes quantization range for YCbCr output
1763e5acb2f5 drm/i915/display: Add a WARN for invalid output range and format
c6926b1be9ba drm/i915/display: Attach content type property for LSPCON
ae2c2df4b068 drm/i915: Split intel_attach_colorspace_property() into HDMI vs. DP variants
29c79b64eedb drm/i915/display: Enable colorspace programming for LSPCON devices
f36e3222cc4b drm/i915/display: Nuke bogus lspcon check
5a3798ada527 drm/i915/display: Enable HDR for Parade based lspcon
3bd722b54768 drm/i915/lspcon: Create separate infoframe_enabled helper
8a4345ec4f5b drm/i915/display: Implement infoframes readback for LSPCON
243120a62a86 drm/i915/display: Implement DRM infoframe read for LSPCON
0712ec72b638 drm/i915/lspcon: Do not send DRM infoframes to non-HDMI sinks
6b7b536d5b38 drm/i915/display: [NOT FOR MERGE] Reduce blanking to support 4k60@10bpp for LSPCON


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
