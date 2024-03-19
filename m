Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30871CD11BF
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Mar 2024 15:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFDA10FB82;
	Tue, 19 Mar 2024 15:14:35 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAE310FB82
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Mar 2024 15:14:33 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rmbAa-00000002U3y-0r9Y; Tue, 19 Mar 2024 17:14:29 +0200
Message-ID: <311efe399cedd3b9ee95e5aac98e1c8956092d0a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, gustavo.sousa@intel.com
Date: Tue, 19 Mar 2024 17:14:15 +0200
In-Reply-To: <87a5muntvo.fsf@intel.com>
References: <20240314065221.1181158-1-luciano.coelho@intel.com>
 <y5sc3bfcyhzmmeq7ru3jgsr2pw3xistizk4ycvbfw22rmn4ijb@erie627pruac>
 <87a5muntvo.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH] drm/xe/display: fix type of intel_uncore_read*() functions
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

On Tue, 2024-03-19 at 17:06 +0200, Jani Nikula wrote:
> On Tue, 19 Mar 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Thu, Mar 14, 2024 at 08:52:21AM +0200, Luca Coelho wrote:
> > > Some of the backported intel_uncore_read*() functions used the wrong
> > > types.  Change the function declarations accordingly.
> > >=20
> > > Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> >=20
> > if a patch affects xe, please always Cc the xe mailing list so it
> > triggers CI on those machines
>=20
> Indeed. I just bounced the patch to intel-xe to trigger CI.

Thanks, guys! I'll do it always from now on.

--
Cheers,
Luca.
