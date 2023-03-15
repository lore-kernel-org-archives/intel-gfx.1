Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA8C76196
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Mar 2023 11:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1205210E9BF;
	Wed, 15 Mar 2023 11:31:59 +0000 (UTC)
X-Greylist: delayed 2615 seconds by postgrey-1.36 at gabe;
 Wed, 15 Mar 2023 11:31:56 UTC
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E921410E9B9;
 Wed, 15 Mar 2023 11:31:56 +0000 (UTC)
Received: from 91-156-4-134.elisa-laajakaista.fi ([91.156.4.134]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1pcOfU-006udF-9c;
 Wed, 15 Mar 2023 12:47:41 +0200
Message-ID: <b10d5ada60ab823a09b64f3bfd79db2dd601d5fd.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 15 Mar 2023 12:47:38 +0200
In-Reply-To: <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: avoid flush_scheduled_work()
 usage
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 2023-03-14 at 20:21 +0900, Tetsuo Handa wrote:
> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
>=20
> Now that i915 is the last flush_scheduled_work() user, for now let's
> start with blind conversion inside the whole drivers/gpu/drm/i915/
> directory. Jani Nikula wants to use two workqueues in order to avoid
> adding new module globals, but I'm not familiar enough to audit and
> split into two workqueues.
>=20
> Link: https://lkml.kernel.org/r/87sfeita1p.fsf@intel.com
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
> Changes in v2:
>   Add missing alloc_workqueue() failure check.

Hi,

Thanks for your patch! But it seems that you only fixed that failure
check, without making the other change Jani proposed, namely, move the
work to the i915 struct instead of making it a global.

I'm working on that now.

--
Cheers,
Luca.
