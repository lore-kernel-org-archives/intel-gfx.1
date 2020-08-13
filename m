Return-Path: <SRS0=YOLQ=BX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD75FC433E1
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2020 07:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B70AE2078B
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2020 07:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B70AE2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7B46E179;
	Thu, 13 Aug 2020 07:56:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C76E179
 for <intel-gfx@lists.freedesktop.org>; Thu, 13 Aug 2020 07:56:37 +0000 (UTC)
IronPort-SDR: j24YhqVqtcCur/UqrZgYf5mFRgUD4oMFtiSt7kqwPtJv3REPLToMBJiq16hyyIHVMVqsIOJ5gN
 4NH4d4RQjjuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="151598188"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="151598188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 00:56:36 -0700
IronPort-SDR: Sgkyh/KTWTx6Ys38eMzkgTE5BxOat01TIcsoOMW3RrEGBkROoiYTDTshb6KsclJHj7vc6BSpY1
 +p6itqPect/A==
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="495780161"
Received: from stallamr-mobl1.amr.corp.intel.com (HELO ldmartin-desk1)
 ([10.213.186.225])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 00:56:35 -0700
Date: Thu, 13 Aug 2020 00:56:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200813075631.oansfg5sstiynjgk@ldmartin-desk1>
X-Patchwork-Hint: ignore
References: <20200724213918.27424-1-lucas.demarchi@intel.com>
 <20200724213918.27424-23-lucas.demarchi@intel.com>
 <b74c416a220331321552464c33bb06080dd99baa.camel@intel.com>
 <20200807131424.GD30770@intel.com>
 <63bc6529b69d6c632f9bbd750db7296cab03abf0.camel@intel.com>
 <20200810054811.GE30770@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810054811.GE30770@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 22/22] drm/i915/dg1: Change DMC_DEBUG{1,
 2} registers
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 11:18:11AM +0530, Anshuman Gupta wrote:
>On 2020-08-07 at 22:56:54 +0530, Souza, Jose wrote:
>> On Fri, 2020-08-07 at 18:44 +0530, Anshuman Gupta wrote:
>> > On 2020-08-04 at 05:01:37 +0530, Souza, Jose wrote:
>> > > On Fri, 2020-07-24 at 14:39 -0700, Lucas De Marchi wrote:
>> > > > From: Anshuman Gupta <
>> > > > anshuman.gupta@intel.com
>> > > >
>> > > >
>> > > > DGFX devices have different DMC_DEBUG* counter MMIO address
>> > > > offset. Incorporate these changes in i915_reg.h for DG1 DC5/DC6
>> > > > counter and handle i915_dmc_info accordingly.
>> > > >
>> > > > Cc: Uma Shankar <
>> > > > uma.shankar@intel.com
>> > > >
>> > > >
>> > > > Signed-off-by: Anshuman Gupta <
>> > > > anshuman.gupta@intel.com
>> > > >
>> > > >
>> > > > Signed-off-by: Lucas De Marchi <
>> > > > lucas.demarchi@intel.com
>> > > >
>> > > >
>> > > > ---
>> > > >  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 9 +++++++--
>> > > >  drivers/gpu/drm/i915/i915_reg.h                      | 2 ++
>> > > >  2 files changed, 9 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c =
b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> > > > index 3644752cc5ec..e3536edcb394 100644
>> > > > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> > > > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> > > > @@ -515,8 +515,13 @@ static int i915_dmc_info(struct seq_file *m, =
void *unused)
>> > > >  		   CSR_VERSION_MINOR(csr->version));
>> > > >
>> > > >  	if (INTEL_GEN(dev_priv) >=3D 12) {
>> > > > -		dc5_reg =3D TGL_DMC_DEBUG_DC5_COUNT;
>> > > > -		dc6_reg =3D TGL_DMC_DEBUG_DC6_COUNT;
>> > > > +		if (IS_DG1(dev_priv)) {
>> > > > +			dc5_reg =3D DG1_DMC_DEBUG_DC5_COUNT;
>> > > > +		} else {
>> > > > +			dc5_reg =3D TGL_DMC_DEBUG_DC5_COUNT;
>> > > > +			dc6_reg =3D TGL_DMC_DEBUG_DC6_COUNT;
>> > > > +		}
>> > > > +
>> > > >  		/*
>> > > >  		 * NOTE: DMC_DEBUG3 is a general purpose reg.
>> > > >  		 * According to B.Specs:49196 DMC f/w reuses DC5/6 counter
>> > > > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i91=
5/i915_reg.h
>> > > > index 4e95312eba24..78bdce67da08 100644
>> > > > --- a/drivers/gpu/drm/i915/i915_reg.h
>> > > > +++ b/drivers/gpu/drm/i915/i915_reg.h
>> > > > @@ -7549,6 +7549,8 @@ enum {
>> > > >  #define BXT_CSR_DC3_DC5_COUNT	_MMIO(0x80038)
>> > > >  #define TGL_DMC_DEBUG_DC5_COUNT	_MMIO(0x101084)
>> > > >  #define TGL_DMC_DEBUG_DC6_COUNT	_MMIO(0x101088)
>> > > > +#define DG1_DMC_DEBUG_DC5_COUNT	_MMIO(0x134154)
>> > > > +#define DG1_DMC_DEBUG_DC6_COUNT	_MMIO(0x134158)
>> > >
>> > > DG1_DMC_DEBUG_DC6_COUNT is not used as DG1 do not support DC6.
>> > > Removing it:
>> >
>> > DG1_DMC_DEBUG_DC6_COUNT is still valid DMC_DEBUG counter for future
>> > igfx platforms, considering name consistency it has been kept with nam=
e DG1_*
>> > inline to B.Spec Index:49787.
>>
>> A discrete graphics card will never be able to reach DC6 as it is a SOC =
power saving feature.
>Is it documented some where, AFAIK DC6 is still diplay C state where it po=
wer off its innermost power well,
>with involvment of some non display third party f/w.
>IMHO if any discrete-gfx would support DC6, it would be useful in the use =
cases where driver is yet to request runtime suspend (DC9)
>but display is already being powered off.

Correct, but I think the more relevant argument here is that it is _not
used_. If it was a bitfield, then ok. But it is a register. I don't think
we want to add all the unused registers. Chances are a new platform that
supports it will already have it in another address already.

I will remove it in the next version. And this is also =


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
>Thanks,
>Anshuman Gupta.
>>
>> >
>> > Thanks,
>> > Anshuman Gupta.
>> > > Reviewed-by: Jos=E9 Roberto de Souza <
>> > > jose.souza@intel.com
>> > > >
>> > >
>> > >
>> > > >
>> > > >  #define DMC_DEBUG3		_MMIO(0x101090)
>> > > >
>> > > >
>> > >
>> > > _______________________________________________
>> > > Intel-gfx mailing list
>> > > Intel-gfx@lists.freedesktop.org
>> > >
>> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>> > >
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
