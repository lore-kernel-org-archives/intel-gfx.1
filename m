Return-Path: <SRS0=aXtb=EJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864EEC388F9
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 15:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304D720715
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 15:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 304D720715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951196EC92;
	Tue,  3 Nov 2020 15:46:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E185A6EC92;
 Tue,  3 Nov 2020 15:46:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D6714A73C9;
 Tue,  3 Nov 2020 15:46:39 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Date: Tue, 03 Nov 2020 15:46:39 -0000
Message-ID: <160441839984.25742.13109867579430129252@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201103152834.12727-1-uma.shankar@intel.com>
In-Reply-To: <20201103152834.12727-1-uma.shankar@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Enable_HDR_on_MCA_LSPCON_based_Gen9_devices_=28rev9=29?=
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

Series: Enable HDR on MCA LSPCON based Gen9 devices (rev9)
URL   : https://patchwork.freedesktop.org/series/68081/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7ce78e26d315 drm/i915/display: Add HDR Capability detection for LSPCON
0fac40ec244f drm/i915/display: Enable HDR on gen9 devices with MCA Lspcon
f5cbc62d4680 drm/i915/display: Attach HDR property for capable Gen9 devices
-:43: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#43: FILE: drivers/gpu/drm/i915/display/intel_dp.c:6737:
+						   connector->dev->mode_config.hdr_output_metadata_property,

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
5a973896bb8d drm/i915/display: Attach content type property for LSPCON
dbed4b7913ed drm/i915/display: Nuke bogus lspcon check
efdec80a4db4 drm/i915/display: Enable BT2020 for HDR on LSPCON devices
dd9e7eca60c8 drm/i915/display: Enable HDR for Parade based lspcon
8f4bf660df48 drm/i915/display: Implement infoframes readback for LSPCON
a2460c40ac7f drm/i915/display: Implement DRM infoframe read for LSPCON
58caffcf5821 drm/i915/lspcon: Create separate infoframe_enabled helper
aca13428895f drm/i915/lspcon: Do not send DRM infoframes to non-HDMI sinks
59892e378eb7 drm/i915/display: [NOT FOR MERGE] Reduce blanking to support 4k60@10bpp for LSPCON


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
