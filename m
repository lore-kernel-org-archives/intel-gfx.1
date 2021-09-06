Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B805AC433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 07:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5622260E8B
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 07:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5622260E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEF089A72;
	Mon,  6 Sep 2021 07:39:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942B89A72;
 Mon,  6 Sep 2021 07:39:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219928948"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="219928948"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 00:39:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="536560328"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 00:39:01 -0700
Date: Mon, 6 Sep 2021 10:32:32 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20210906041300.508458-1-kai.heng.feng@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2109061031450.3554566@eliteleevi.tm.intel.com>
References: <20210906041300.508458-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [Intel-gfx] [PATCH] drm/i915/audio: Use BIOS provided value for
 RKL HDA link
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

Hi,

On Mon, 6 Sep 2021, Kai-Heng Feng wrote:

> Commit 989634fb49ad ("drm/i915/audio: set HDA link parameters in
> driver") makes HDMI audio on Lenovo P350 disappear.
> 
> So in addition to TGL, extend the logic to RKL to use BIOS provided
> value to fix the regression.

thanks Kai-Heng! We were not aware of commercial RKL systems following the
old BIOS guidance, but given you just hit one, then this definitely is
needed:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>          

Br, Kai
