Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C936AC79FBF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CFC10E17C;
	Thu, 10 Sep 2026 18:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l/SUkIQg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C1B10E17C
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:54:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F0F2E43B78;
 Thu, 10 Sep 2026 18:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98ED1F0089D;
 Thu, 10 Sep 2026 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789066458;
 bh=0Me++7G1Ao36MlnCdmEwep/hUnVaSbuXuTQHNcRYEw4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=l/SUkIQgqJHtRmR9H5yDdxSIOnTXIlSKhwd5NhAIDvr4rz0cvZ9DUX06B1U3lDvg0
 RT456qXnyI9KI+pmjbCMFjX9F5liZ7fldae5za6ZZCKEyH3ihiIzip1no8qWnbNNgC
 sAs2Cec2D2f4UpnoBj6KkCsjL1c8OCSwx9z+trfGPBXx+7Gfde51D5j+GhqXQL3W0G
 v6bJ5g8tTeQM+Ki9uXDGrGeQ6sS/j5aW0iVaa2JIe0z7Ccj6I0WXpHFOv+Av5CUKVo
 smsyb9APFs1T8hnSb9ONGtxlr0OKFESdtw6VRVeEa5aZ+OHBv7zU32SLeNA63nRDHK
 xqZwaEKsx01zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/pmu: Use a delayed wakeref put in get_rc6()
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
 <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 18:54:18 +0000
Message-Id: <20260910185418.A98ED1F0089D@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PMU callbacks acquire `spinlock_t` locks while the scheduler holds=
 the runqueue lock (`raw_spinlock_t`), violating lock nesting rules on PREE=
MPT_RT.
--

commit aeee9e0e0071ac1defceaf4b6ea0f13bad5f5898
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/i915/pmu: Use a delayed wakeref put in get_rc6()

This commit replaces intel_gt_pm_put_async() with intel_gt_pm_put_delay()
in get_rc6() to avoid waking a workqueue worker while the scheduler holds
the runqueue lock.

> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_=
pmu.c
> index 1c3bafda9c708..4598d9b5678a2 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -229,7 +229,12 @@ static u64 get_rc6(struct intel_gt *gt)
>  	wakeref =3D intel_gt_pm_get_if_awake(gt);
>  	if (wakeref) {
>  		val =3D __get_rc6(gt);
> -		intel_gt_pm_put_async(gt, wakeref);
> +		/*
> +		 * We are reached from the perf callbacks, which perf may invoke
> +		 * from the scheduler with the runqueue lock held. Defer the put
> +		 * on a timer so that it can never wake a task from here.
> +		 */
> +		intel_gt_pm_put_delay(gt, wakeref, 1);
>  	}
> =20
>  	spin_lock_irqsave(&pmu->lock, flags);

[Severity: High]
This is a pre-existing issue, but does this still cause a lock nesting
violation on PREEMPT_RT?

Since get_rc6() is reached from PMU callbacks with the runqueue lock held
(which is a raw_spinlock_t), acquiring a spinlock_t here (pmu->lock) will
cause a scheduling while atomic panic on PREEMPT_RT kernels, because
spinlock_t becomes a sleepable rt_mutex.

Does __get_rc6() also trigger this panic? It looks like it acquires=20
uncore->lock via intel_rc6_residency_ns(), which is also a spinlock_t.

Similarly, guc_engine_busyness() appears to have the same underlying issue=
=20
with guc->timestamp.lock in the PMU callback path.=20

Are there plans to convert these locks to raw_spinlock_t or avoid acquiring
them entirely when called from perf scheduler contexts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910184253.1231=
313-4-umesh.nerlige.ramappa@intel.com?part=3D2
