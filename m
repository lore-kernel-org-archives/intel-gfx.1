Return-Path: <SRS0=ObOY=N5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A4EC433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 08:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACF060F13
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 08:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ACF060F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C3189D87;
	Tue,  7 Sep 2021 08:10:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0D89DF9
 for <intel-gfx@lists.freedesktop.org>; Tue,  7 Sep 2021 08:09:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="220186736"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220186736"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 01:09:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="537823684"
Received: from hoermank-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 01:09:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Souza\, Jose" <jose.souza@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Nautiyal\, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <97661d7d86eef478f95e6d44bcb5f6b2251cd03f.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630512523.git.jani.nikula@intel.com>
 <87v93h9azh.fsf@intel.com>
 <97661d7d86eef478f95e6d44bcb5f6b2251cd03f.camel@intel.com>
Date: Tue, 07 Sep 2021 11:09:54 +0300
Message-ID: <87a6ko957x.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm/i915/bios: remove vbt
 ddi_port_info caching
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

On Fri, 03 Sep 2021, "Souza, Jose" <jose.souza@intel.com> wrote:
> On Fri, 2021-09-03 at 14:04 +0300, Jani Nikula wrote:
>> Jos=C3=A9, I'd like to get an ack from you on this before applying. I kn=
ow
>> it's bound conflict with your in flight series. Thoughts?
>
> If you are okay in adding more data at the end of intel_bios_encoder_data=
 we should be fine.
> Information from other VBT blocks will need to be added to intel_bios_enc=
oder_data.
>
> It will badly conflict with series but any redundant byte saved is worthy.

Thanks for the review and ack, pushed.

Moving stuff from drm_i915_private to intel_bios_encoder_data will be a
nice improvement.

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
