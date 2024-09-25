Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C8CF9C6B
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Sep 2024 14:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D4E10E83D;
	Wed, 25 Sep 2024 14:21:53 +0000 (UTC)
Received: from coelho.fi (static.29.146.99.88.clients.your-server.de
 [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E3610EA20
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Sep 2024 14:21:51 +0000 (UTC)
Received: from 91-155-255-213.elisa-laajakaista.fi ([91.155.255.213]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1stStm-00000000GvV-0ooO; Wed, 25 Sep 2024 17:21:48 +0300
Message-ID: <4b02b4202a9216548d241f3f7dec889e7b1c194f.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Wed, 25 Sep 2024 17:21:45 +0300
In-Reply-To: <20240918190441.29071-2-ville.syrjala@linux.intel.com>
References: <20240918190441.29071-1-ville.syrjala@linux.intel.com>
 <20240918190441.29071-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/i915/dp: Make intel_dp_get_colorimetry_status()
 static
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

On Wed, 2024-09-18 at 22:04 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> intel_dp_get_colorimetry_status() is not used outside of
> intel_dp.c. Make it static.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
