Return-Path: <SRS0=Ww0K=JM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E30BC43460
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Apr 2021 12:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D4F0611AC
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Apr 2021 12:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D4F0611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0A16E507;
	Thu, 15 Apr 2021 12:59:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76256E504;
 Thu, 15 Apr 2021 12:59:33 +0000 (UTC)
IronPort-SDR: cjefKX4AOK9ElzSGqvu/zj577Zqhrfd3HIZ38wtqC3mN4ZZbrk6w4nRv2N9V9y+PTeI8rtI5l2
 4+6QvKnvVcDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="280159586"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="280159586"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 05:59:15 -0700
IronPort-SDR: YCqPSg8wcaXFJ3rJLwzRlZkuIHat5TcOyq9TJUbqU7jPqfoEecEMInuDRtT+igrylGRK5OYN23
 hHvwm1a4lB2w==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="418732658"
Received: from rkapur-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.63.86])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 05:59:13 -0700
Date: Thu, 15 Apr 2021 08:59:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YHg4nz/ndzDRmPjd@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Intel-gfx] [PULL] drm-intel-fixes
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2021-04-15:

Display panel & power related fixes:

- Backlight fix (Lyude)
- Display watermark fix (Ville)
- VLV panel power fix (Hans)

Thanks,
Rodrigo.

The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

  Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-04-=
15

for you to fetch changes up to aee6f25e9c911323aa89a200e1bb160c1613ed3d:

  drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disablin=
g the panel (2021-04-12 08:00:33 -0400)

----------------------------------------------------------------
Display panel & power related fixes:

- Backlight fix (Lyude)
- Display watermark fix (Ville)
- VLV panel power fix (Hans)

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disa=
bling the panel

Lyude Paul (1):
      drm/i915/dpcd_bl: Don't try vesa interface unless specified by VBT

Ville Syrj=E4l=E4 (1):
      drm/i915: Don't zero out the Y plane's watermarks

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 1 -
 drivers/gpu/drm/i915/display/vlv_dsi.c                | 4 ++--
 drivers/gpu/drm/i915/intel_pm.c                       | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
