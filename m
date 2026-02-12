Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933AEEA845
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01EA10E02D;
	Thu, 12 Feb 2026 19:04:54 +0000 (UTC)
X-Greylist: delayed 1526 seconds by postgrey-1.36 at gabe;
 Thu, 12 Feb 2026 19:04:53 UTC
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCDB10E02D
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Feb 2026 19:04:53 +0000 (UTC)
Received: from 91-152-154-15.elisa-laajakaista.fi ([91.152.154.15]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vqbaz-00000002KNG-0OtA; Thu, 12 Feb 2026 20:39:22 +0200
Message-ID: <fbec3aa42ac6d4c44393e9a9d6c8efe9bc55e64d.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 12 Feb 2026 20:39:17 +0200
In-Reply-To: <8f5be7cb5ebe6e1ee0d09b95234cc8d75584c3e6@intel.com>
References: <20260212125526.344401-1-luciano.coelho@intel.com>
 <20260212125526.344401-13-luciano.coelho@intel.com>
 <8f5be7cb5ebe6e1ee0d09b95234cc8d75584c3e6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 12/16] drm/i915/display: convert W/As in intel_overlay.c
 to new framework
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

On Thu, 2026-02-12 at 18:06 +0200, Jani Nikula wrote:
> On Thu, 12 Feb 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > Convert the low-hanging fruits of workaround checks to the workaround
> > framework.  Instead of having display structure checks for the
> > workarounds all over, concentrate the checks in intel_wa.c.
>=20
> This patch doesn't do anything, likely due to a change in
> intel_overlay.c.

Oh, right, the workaround has actually been dropped in intel_overlay.c
and I didn't realize it when rebasing.  I'll remove it from the series.

--
Cheers,
Luca.
