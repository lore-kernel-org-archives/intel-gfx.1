Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A206C2D0E4
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 19:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D6520BED
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 19:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D6520BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CF26E061;
	Tue, 17 Nov 2020 19:31:25 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767316E062
 for <intel-gfx@lists.freedesktop.org>; Tue, 17 Nov 2020 19:31:23 +0000 (UTC)
IronPort-SDR: ngQ51xfV6YxG81XT8WwUlE2q1xJtxVTkKdXXfs+bHwW+WUfx5M0Kh66i0DQWO1HmLRY4r2Dvcf
 DxsB5D3OZWIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="167484544"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="167484544"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 11:31:18 -0800
IronPort-SDR: ViV58o7kqdqYaNWwEAI7iLearxN6c8XMzvwp2N8dgxfCkcIJeBXQMHetl3cx6V75X0IiFu8v4y
 Nidix/lczFUQ==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="310875936"
Received: from dshaukar-mobl.amr.corp.intel.com (HELO ldmartin-desk1)
 ([10.209.56.95])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 11:31:16 -0800
Date: Tue, 17 Nov 2020 11:31:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aditya Swarup <aditya.swarup@intel.com>
Message-ID: <20201117193114.ujqf4mgu3z2pzkab@ldmartin-desk1>
References: <20201117185029.22078-1-aditya.swarup@intel.com>
 <20201117185029.22078-3-aditya.swarup@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117185029.22078-3-aditya.swarup@intel.com>
Subject: Re: [Intel-gfx] [PATCH 02/21] drm/i915/tgl: Fix macros for TGL SOC
 based WA
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 10:50:10AM -0800, Aditya Swarup wrote:
>@@ -1579,9 +1579,9 @@ static inline const struct i915_rev_steppings *
> tgl_revids_get(struct drm_i915_private *dev_priv)
> {
> 	if (IS_TGL_U(dev_priv) || IS_TGL_Y(dev_priv))
>-		return tgl_uy_revids;
>+		return tgl_uy_revids + INTEL_REVID(dev_priv);

oohh, no. You have to at least check you are not accessing out of
bounds. New HW running on old kernel should not access create invalid
accesses like this.

Lucas De Marchi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
