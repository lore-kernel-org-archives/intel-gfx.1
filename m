Return-Path: <SRS0=c+lk=PH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6EDC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 12:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F3A60F93
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Oct 2021 12:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7F3A60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4330F6EBA8;
	Tue, 19 Oct 2021 12:39:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18B16EC01;
 Tue, 19 Oct 2021 12:39:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228373796"
X-IronPort-AV: E=Sophos;i="5.87,384,1631602800"; d="scan'208";a="228373796"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 05:39:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,384,1631602800"; d="scan'208";a="494077200"
Received: from jsanz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.211.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 05:39:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
In-Reply-To: <20211018084147.iuexgyykyrrx2ykw@gilmour>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211014150059.28957-1-jani.nikula@intel.com>
 <871r4muxds.fsf@intel.com> <20211018084147.iuexgyykyrrx2ykw@gilmour>
Date: Tue, 19 Oct 2021 15:39:20 +0300
Message-ID: <875yttqjd3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/dp: add helpers to read link
 training delays
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

On Mon, 18 Oct 2021, Maxime Ripard <maxime@cerno.tech> wrote:
> Hi Jani,
>
> On Fri, Oct 15, 2021 at 06:21:35PM +0300, Jani Nikula wrote:
>> On Thu, 14 Oct 2021, Jani Nikula <jani.nikula@intel.com> wrote:
>> > The link training delays are different and/or available in different
>> > DPCD offsets depending on:
>> >
>> > - Clock recovery vs. channel equalization
>> > - DPRX vs. LTTPR
>> > - 128b/132b vs. 8b/10b
>> > - DPCD 1.4+ vs. earlier
>> >
>> > Add helpers to get the correct delays in us, reading DPCD if
>> > necessary. This is more straightforward than trying to retrofit the
>> > existing helpers to take 128b/132b into account.
>> >
>> > Having to pass in the DPCD receiver cap field seems unavoidable, becau=
se
>> > reading it involves checking the revision and reading extended receiver
>> > cap. So unfortunately the interface is mixed cached and read as needed.
>> >
>> > v2: Remove delay_us < 0 check and the whole local var (Ville)
>> >
>> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> Maarten, Maxime, Thomas -
>>=20
>> Ack on the first two patches in this series?
>>=20
>> Should we merge them via a topic branch to both drm-misc-next and
>> drm-intel-next, or is it fine to merge them all via drm-intel-next? We
>> might be at a point in the development cycle that it takes a while to
>> get the branches in sync again.
>
> I guess the easiest would be to send a PR so that we can merge it in the
> two branches then.

Sent.

https://lore.kernel.org/r/878ryps5b6.fsf@intel.com

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
