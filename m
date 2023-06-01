Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04154C77B7E
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Jun 2023 12:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513210E13A;
	Thu,  1 Jun 2023 12:36:14 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791FE10E13A
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Jun 2023 12:36:13 +0000 (UTC)
Received: from 85-76-12-113-nat.elisa-mobile.fi ([85.76.12.113]
 helo=pjadha2x-MOBL.gar.corp.intel.com)
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q4hXD-008kaP-JP;
 Thu, 01 Jun 2023 15:36:09 +0300
Message-ID: <051c3a968f25cbfa63eb55b378aa680b7225b643.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Mika Kahola <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 01 Jun 2023 15:34:35 +0300
In-Reply-To: <20230601101314.332392-1-mika.kahola@intel.com>
References: <20230601101314.332392-1-mika.kahola@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/mtl: Reset only one lane in
 case of MFD
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

On Thu, 2023-06-01 at 13:13 +0300, Mika Kahola wrote:
> In case when only two or less transmit lanes are owned such as MFD
> (DP-alt with x2 lanes) we need to reset only one data lane (lane0).
> With only x2 lanes we don't need to poll for the phy current
> status on both data lanes since only the owned data lane will respond.
>=20
> v2: Find better naming for lanes and revise the commit message (Luca)
>=20
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com> (v1)
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 39 ++++++++++++--------
>  1 file changed, 23 insertions(+), 16 deletions(-)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
