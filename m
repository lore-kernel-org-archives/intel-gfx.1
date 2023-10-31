Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E52BC4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 31 Oct 2023 10:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1E810E44A;
	Tue, 31 Oct 2023 10:05:06 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7510E44A
 for <intel-gfx@lists.freedesktop.org>; Tue, 31 Oct 2023 10:05:05 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1qxlcL-00000000H0C-2zNL; Tue, 31 Oct 2023 12:05:03 +0200
Message-ID: <7c282e7dd97334032862e6f92f450fb2c4e5b90e.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: "Manna, Animesh" <animesh.manna@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Date: Tue, 31 Oct 2023 12:05:00 +0200
In-Reply-To: <DS7PR11MB5990F52A4CC52DB9758FE8EEF9A0A@DS7PR11MB5990.namprd11.prod.outlook.com>
References: <20231027115711.2713226-1-animesh.manna@intel.com>
 <c47bd13869e6664367d1684ebcf4305517909df1.camel@coelho.fi>
 <DS7PR11MB5990F52A4CC52DB9758FE8EEF9A0A@DS7PR11MB5990.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/dsb: DSB code refactoring
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 2023-10-31 at 09:15 +0000, Manna, Animesh wrote:
>=20
> > -----Original Message-----
> > From: Luca Coelho <luca@coelho.fi>
> > Sent: Tuesday, October 31, 2023 1:14 PM
> > To: Manna, Animesh <animesh.manna@intel.com>; intel-
> > gfx@lists.freedesktop.org
> > Cc: Nikula, Jani <jani.nikula@intel.com>
> > Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/dsb: DSB code refactoring
> >=20
> > On Fri, 2023-10-27 at 17:27 +0530, Animesh Manna wrote:
> > > Refactor DSB implementation to be compatible with Xe driver.
> > >=20
> > > v1: RFC version.
> > > v2: Make intel_dsb structure opaque from external usage. [Jani]
> > > v3: Rebased on latest.
> > > v4:
> > > - Add boundary check in dsb_buffer_memset(). [Luca]
> > > - Use size_t instead of u32. [Luca]
> > >=20
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > > ---
> >=20
> > [...]
> > > +void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32
> > > +idx, u32 val, size_t size) {
> > > +	if ((idx > dsb_buf->buf_size / 4) || (size > dsb_buf->buf_size - id=
x
> > > +* 4))
> >=20
> > You actually don't need the first expression.  This expression should
> > enough:
> >=20
> > 	dsb_buf->buf_size <=3D (idx + size) * sizeof(*dsb_buf->cmd_buf)
>=20
> Here size is in bytes, but idx is index of 32 bytes array. So, the above =
expression would be,
>=20
> dsb_buf->buf_size <=3D (idx * sizeof(*dsb_buf->cmd_buf) + size)

Oh, you're right, of course.


> The same is done with 2nd expression but agree to use sizeof() instead of=
 magic number 4.
>=20
> The first expression is added if idx is big number and due to overflow th=
e above check can pass which is not correct. Please let me know your though=
ts, if you are not ok will drop maybe.

If you're worried about overflow when you're multiplying by 4, then you
can just do it the opposite way, still with a single expression:

dsb_buf->buf_size / sizeof(*dsb_buf->cmd_buf) <=3D idx + size / sizeof(*dsb=
_buf->cmd_buf)

Or, taking advantage of the fact that both buf_size and size need to be
divided by sizeof(), we could something like:

idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf)

...but we're bike-shedding.  I don't think the number of expressions or
the complexity of the expressions matter much here, unless you're
really in a hotpath, in which case you should add an unlikely() or so.

I'll leave it to you.


> >=20
> > > +		return;
> >=20
> > Blindly returning here doesn't solve the problem, it just hides it.  I =
think the
> > best would be to use WARN_ON() instead of if.
> >=20
> > So:
> > 	WARN_ON(dsb_buf->buf_size <=3D (idx + size) * sizeof(*dsb_buf-
> > > cmd_buf));
>=20
> I will add the WARN_ON().

This is the part that I actually think is important. ;)

--
Cheers,
Luca.
