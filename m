Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA71EB64D7
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jun 2023 12:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4901788EFF;
	Mon, 26 Jun 2023 12:05:17 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CEB88EFF
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Jun 2023 12:05:15 +0000 (UTC)
Received: from 91-155-254-218.elisa-laajakaista.fi ([91.155.254.218]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1qDkxx-009GQg-2H;
 Mon, 26 Jun 2023 15:05:11 +0300
Message-ID: <b16da6722996675475fbbe7197a19345e8bc8349.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:05:08 +0300
In-Reply-To: <20230621123156.14907-1-jani.nikula@intel.com>
References: <20230621123156.14907-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/doc: fix duplicate declaration
 warning
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

On Wed, 2023-06-21 at 15:31 +0300, Jani Nikula wrote:
> We have duplicate kernel-doc directives for the same struct, leading to:
>=20
> /home/jani/src/linux/Documentation/gpu/driver-uapi.rst:2279: WARNING: Dup=
licate C declaration, also defined at rfc/i915_scheduler:3.
> Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.
>=20
> Use the Sphinx C domain namespace for the rfc document to fix this.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

This looks pretty straightforward.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>


--
Cheers,
Luca.
