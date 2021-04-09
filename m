Return-Path: <SRS0=Zf8m=JG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE549C433B4
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 08:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DC261181
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Apr 2021 08:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DC261181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FC46EB9B;
	Fri,  9 Apr 2021 08:57:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616D6EB93;
 Fri,  9 Apr 2021 08:57:17 +0000 (UTC)
IronPort-SDR: wgwZKn4pwpEoB/9QZ8VuQAAIR3PgboLCyKlj74yhyVilPcaRyzf3/JsAXQcbuh12DeogwTXz0B
 tWV3as9y/gaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193762226"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="193762226"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 01:57:16 -0700
IronPort-SDR: 1GpxFtmmU1uefFsLGzkYtffuJOWKB35DlAJoPMKta/AXEaBHYEEaUPAXE1Lciig8krYvXht5Dd
 yA5YJDu+vibQ==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="380580234"
Received: from carlstax-mobl4.amr.corp.intel.com (HELO intel.com)
 ([10.212.45.152])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 01:57:14 -0700
Date: Fri, 9 Apr 2021 04:57:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <YHAW6NInrybUoat6@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Only one last minute fix targeting stable to fix a null dereference.

Here goes drm-intel-fixes-2021-04-09:
- Fix invalid access to ACPI _DSM objects (Takashi)

Thanks,
Rodrigo.

The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-04-09

for you to fetch changes up to b6a37a93c9ac3900987c79b726d0bb3699d8db4e:

  drm/i915: Fix invalid access to ACPI _DSM objects (2021-04-07 19:07:44 -0400)

----------------------------------------------------------------
- Fix invalid access to ACPI _DSM objects (Takashi)

----------------------------------------------------------------
Takashi Iwai (1):
      drm/i915: Fix invalid access to ACPI _DSM objects

 drivers/gpu/drm/i915/display/intel_acpi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
