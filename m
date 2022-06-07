Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CB6C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Jun 2022 08:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AA012AFB3;
	Tue,  7 Jun 2022 08:07:51 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE8812AFB6
 for <intel-gfx@lists.freedesktop.org>; Tue,  7 Jun 2022 08:07:50 +0000 (UTC)
Received: from 91-156-6-107.elisa-laajakaista.fi ([91.156.6.107]
 helo=[192.168.100.150])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1nyUFe-001L20-O4;
 Tue, 07 Jun 2022 11:07:48 +0300
Message-ID: <b036ba299e738383186df4a9bc47b658a0fc43c1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 07 Jun 2022 11:07:46 +0300
In-Reply-To: <871qw0rj99.fsf@intel.com>
References: <20220607074433.1202917-1-luca@coelho.fi>
 <871qw0rj99.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove noisy logs in
 intel_dp_dsc_get_output_bpp()
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

On Tue, 2022-06-07 at 11:05 +0300, Jani Nikula wrote:
> On Tue, 07 Jun 2022, Luca Coelho <luca@coelho.fi> wrote:
> > From: Luca Coelho <luciano.coelho@intel.com>
> >=20
> > The intel_dp_dsc_get_output_bpp() function outputs two lines of
> > unconditional logs, which was okay when it was called only once.  But
> > now, we also call this function from intel_dp_mode_valid(), which is
> > in turn called for every mode we need to validate.  This causes a lot
> > of useless noise.
> >=20
> > Remove the unconditional prints to avoid spamming the logs.  Also
> > remove one more print that is not unconditional, but is related.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>=20
> Some of these might be useful on the compute config path, but meh.

Yeah, as we discussed offline, it was not worth refactoring it for the
config path.  If needed, we can add them back in a less noisy way.


> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks!

--
Cheers,
Luca.
