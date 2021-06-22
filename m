Return-Path: <SRS0=wfJw=LQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D76DC2B9F4
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Jun 2021 13:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBD261289
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Jun 2021 13:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BBD261289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CF66E041;
	Tue, 22 Jun 2021 13:41:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927336E041
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Jun 2021 13:41:23 +0000 (UTC)
IronPort-SDR: 9shjUzl857hfI8R1sKhoRyuv1K51S491LZKggqMesDH8Zba3pEsA9jinR7scgTfI/MhZpdRRzc
 RZtcVGzSmfrA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206873529"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="206873529"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 06:41:21 -0700
IronPort-SDR: ns6RYT4PnssQDk3PnYixhijf9rqguS7KlW1f1LmUOqJ4/lCJnImQdzUgKBkq9TKxxnJRTDFtZ3
 pkGVVo6miRbQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="486917128"
Received: from shlomitt-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 06:41:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Navare\, Manasi" <manasi.d.navare@intel.com>
In-Reply-To: <20210621213447.GA20257@labuser-Z97X-UD5H>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210610090528.20511-1-jani.nikula@intel.com>
 <20210611231846.GA12407@labuser-Z97X-UD5H> <87wnqwyi06.fsf@intel.com>
 <20210621213447.GA20257@labuser-Z97X-UD5H>
Date: Tue, 22 Jun 2021 16:41:08 +0300
Message-ID: <877dimuidn.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/dsc: abstract helpers to get
 bigjoiner primary/secondary crtc
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021, "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> Reviewed-by: Manasi Navare <manasi.dl.navare@intel.com>

Thanks, pushed to drm-intel-next.

BR,
Jani


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
