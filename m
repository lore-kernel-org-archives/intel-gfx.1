Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD27EEA84C
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E171310E784;
	Thu, 12 Feb 2026 19:04:56 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9D310E2A0
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Feb 2026 19:04:55 +0000 (UTC)
Received: from 91-152-154-15.elisa-laajakaista.fi ([91.152.154.15]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vqbbv-00000002KNT-11RF; Thu, 12 Feb 2026 20:40:20 +0200
Message-ID: <b0e7e7c476f154e043cbd671acc430c952fe7ad7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 12 Feb 2026 20:40:17 +0200
In-Reply-To: <ac5d13a15dfb4474f3c62289f9996d5e33e7c2fd@intel.com>
References: <20260212125526.344401-1-luciano.coelho@intel.com>
 <ac5d13a15dfb4474f3c62289f9996d5e33e7c2fd@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 00/16] drm/i915/display: convert a bunch of W/A checks
 to the new framework
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

On Thu, 2026-02-12 at 18:07 +0200, Jani Nikula wrote:
> On Thu, 12 Feb 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > Hi,
> >=20
> > This series convert the "low hanging fruits" of workaround checks to
> > the new framework.  Some of the workarounds check other values that
> > are not in the intel_display structure, so they don't directly fit in
> > the workaround framework and will be left for later.
>=20
> This series needs to be sent to intel-xe too for xe CI.
>=20
> I did not do a detailed review, but I approve of the direction here.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks! I'll resend without the NOP patch and Cc intel-xe as well.

--
Cheers,
Luca.
