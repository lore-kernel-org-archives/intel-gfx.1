Return-Path: <SRS0=q2Gh=HB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4909BC433DB
	for <intel-gfx@archiver.kernel.org>; Sat, 30 Jan 2021 18:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4AC064E11
	for <intel-gfx@archiver.kernel.org>; Sat, 30 Jan 2021 18:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4AC064E11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CADF6E13A;
	Sat, 30 Jan 2021 18:55:58 +0000 (UTC)
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Sat, 30 Jan 2021 18:55:56 UTC
Received: from smtprelay.hostedemail.com (smtprelay0018.hostedemail.com
 [216.40.44.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825926E13A
 for <intel-gfx@lists.freedesktop.org>; Sat, 30 Jan 2021 18:55:56 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id A73CB18012022
 for <intel-gfx@lists.freedesktop.org>; Sat, 30 Jan 2021 18:47:53 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id AB223181D303C;
 Sat, 30 Jan 2021 18:47:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: paint73_001571e275b3
X-Filterd-Recvd-Size: 4233
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Sat, 30 Jan 2021 18:47:51 +0000 (UTC)
Message-ID: <719e0f14852d132a6649dbd5791fca17f251cb8e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Sat, 30 Jan 2021 10:47:50 -0800
In-Reply-To: <d687691df8f9978c7b2362c18d77a16b49be76b0.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
 <d687691df8f9978c7b2362c18d77a16b49be76b0.1598331148.git.joe@perches.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 10/29] drm/i915: Avoid comma separated
 statements
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

Ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0drivers/gpu/drm/i915/gt/gen8_ppgtt.c           | 8 +++++---
> =A0drivers/gpu/drm/i915/gt/intel_gt_requests.c    | 6 ++++--
> =A0drivers/gpu/drm/i915/gt/selftest_workarounds.c | 6 ++++--
> =A0drivers/gpu/drm/i915/intel_runtime_pm.c        | 6 ++++--
> =A04 files changed, 17 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/=
gt/gen8_ppgtt.c
> index 699125928272..114c13285ff1 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -323,10 +323,12 @@ static int __gen8_ppgtt_alloc(struct i915_address_s=
pace * const vm,
> =A0			}
> =A0
> =

> =A0			spin_lock(&pd->lock);
> -			if (likely(!pd->entry[idx]))
> +			if (likely(!pd->entry[idx])) {
> =A0				set_pd_entry(pd, idx, pt);
> -			else
> -				alloc =3D pt, pt =3D pd->entry[idx];
> +			} else {
> +				alloc =3D pt;
> +				pt =3D pd->entry[idx];
> +			}
> =A0		}
> =A0
> =

> =A0		if (lvl) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/dr=
m/i915/gt/intel_gt_requests.c
> index 66fcbf9d0fdd..54408d0b5e6e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -139,8 +139,10 @@ long intel_gt_retire_requests_timeout(struct intel_g=
t *gt, long timeout)
> =A0	LIST_HEAD(free);
> =A0
> =

> =A0	interruptible =3D true;
> -	if (unlikely(timeout < 0))
> -		timeout =3D -timeout, interruptible =3D false;
> +	if (unlikely(timeout < 0)) {
> +		timeout =3D -timeout;
> +		interruptible =3D false;
> +	}
> =A0
> =

> =A0	flush_submission(gt, timeout); /* kick the ksoftirqd tasklets */
> =A0	spin_lock(&timelines->lock);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu=
/drm/i915/gt/selftest_workarounds.c
> index febc9e6692ba..3e4cbeed20bd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -521,8 +521,10 @@ static int check_dirty_whitelist(struct intel_contex=
t *ce)
> =A0
> =

> =A0		srm =3D MI_STORE_REGISTER_MEM;
> =A0		lrm =3D MI_LOAD_REGISTER_MEM;
> -		if (INTEL_GEN(engine->i915) >=3D 8)
> -			lrm++, srm++;
> +		if (INTEL_GEN(engine->i915) >=3D 8) {
> +			lrm++;
> +			srm++;
> +		}
> =A0
> =

> =A0		pr_debug("%s: Writing garbage to %x\n",
> =A0			 engine->name, reg);
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i9=
15/intel_runtime_pm.c
> index 153ca9e65382..f498f1c80755 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -201,8 +201,10 @@ __print_intel_runtime_pm_wakeref(struct drm_printer =
*p,
> =A0		unsigned long rep;
> =A0
> =

> =A0		rep =3D 1;
> -		while (i + 1 < dbg->count && dbg->owners[i + 1] =3D=3D stack)
> -			rep++, i++;
> +		while (i + 1 < dbg->count && dbg->owners[i + 1] =3D=3D stack) {
> +			rep++;
> +			i++;
> +		}
> =A0		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> =A0		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
> =A0	}


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
