Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954D7E7E35E
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Apr 2026 09:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E15710F459;
	Fri,  3 Apr 2026 09:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ab09bgN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34ED10F459
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Apr 2026 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775209626; x=1806745626;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nz/B1iQ+ck18M4K5lxMvqx946ciYXNZHUeg84ddWy+g=;
 b=Ab09bgN1LA2sPsZzUXedh6SxD1kG6fITIM2Yn0tVc+MjGB6H+ZG4DvIF
 XnmXXo57qZMtd7hipFnlboAAzLTjmyOGh+4HW/iON4Y2zMX82DwuMOAxH
 E3sB4qgVvt4hvjKIfJgwrWFp3jSzVXKGND+JmyopCmvB1z/gUBDbmZoZU
 nyBiq4wZx878NUOeRy+e7BNl80g2AD/5OYwWA5jb3Vwl3qgbX7SQcO1JN
 HfL+3TMioMIrTN9PlW2jAirN70t6DrwPdBrsfk2MHANCxfQT4R11ZdfM2
 NL+uOKTuNSdR6c/qSGho5G7Nc4cDL6lx4PkxCNFIltFgqb4IsGDWQGOsy A==;
X-CSE-ConnectionGUID: zR7+cuA8T5yeFHnoH+nhgQ==
X-CSE-MsgGUID: Fx0fwC+1Tz6PkoLCYyT/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75996288"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="75996288"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 02:47:05 -0700
X-CSE-ConnectionGUID: NJYaLC4OQdOQAosx7Ew3/w==
X-CSE-MsgGUID: QmSZ2erzSfCn/9sr8hAjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="223959538"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.219])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 02:47:03 -0700
Message-ID: <73fc2e43910f2295374e7f2ce55c73d59f0fd763.camel@linux.intel.com>
Subject: Re: [RFC v3 2/2] drm/i915/selftests: Prevent userspace mapping
 invalidation
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka	
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Date: Fri, 03 Apr 2026 11:47:00 +0200
In-Reply-To: <20260403090019.1933036-3-krzysztof.karas@intel.com>
References: <20260403090019.1933036-1-krzysztof.karas@intel.com>
 <20260403090019.1933036-3-krzysztof.karas@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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

Hi Krzysztof,

I think your solution is very good, however, I still have a few comments.

On Fri, 2026-04-03 at 09:00 +0000, Krzysztof Karas wrote:
> Migration testing in i915 assumes current task's address space
> to allocate new userspace mapping and uses it without
> registering real user for that address space in mm_struct.
> On single NUMA node setups PCI probe executes in the same
> context as userspace process calling the test (i915_selftest
> from IGT), but when multiple nodes are available, the PCI code
> puts probe into a kernel workqueue. This switches execution in
> a kworker, which does not have its own address space in
> userspace and must borrow such memory from another process, so
> "current->active_mm" is unknown at the start of the test.
>=20
> It was observed that mm->mm_users would occasionally be 0
> or drop to 0 during the test due to short delay between
> scheduling and executing work in forked process, which reaped
> userspace mappings, further leading to failures upon reading
> from userland memory.
>=20
> Prevent this by making use of trusted task's mm via
> user-provided PID if needed.
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> Fixes: 34b1c1c71d37 ("i915/selftest/igt_mmap: let mmap tests run in kthre=
ad")
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2 (Janusz):
>  * Reword and shorten commit message to be more precise.
>  * Reorder variable declarations to follow upside down christmas
>  tree style.
>=20
> v3 (Andi):
>  * Prevent PID and mm leaks.
>  * Remove a flag and use mm pointer to determine whether to
>  release references to the memory.
>=20
>  .../drm/i915/gem/selftests/i915_gem_mman.c    | 14 +++----
>  .../gpu/drm/i915/selftests/i915_selftest.c    | 38 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers=
/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 9d454d0b46f2..0752e758b01b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -1847,11 +1847,12 @@ static int igt_mmap_revoke(void *arg)
>  int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
>  {
>  	int ret;
> -	bool unuse_mm =3D false;
>  	static const struct i915_subtest tests[] =3D {
>  		SUBTEST(igt_partial_tiling),
>  		SUBTEST(igt_smoke_tiling),
>  		SUBTEST(igt_mmap_offset_exhaustion),
> +	};
> +	static const struct i915_subtest vma_tests[] =3D {
>  		SUBTEST(igt_mmap),
>  		SUBTEST(igt_mmap_migrate),
>  		SUBTEST(igt_mmap_access),
> @@ -1859,15 +1860,12 @@ int i915_gem_mman_live_selftests(struct drm_i915_=
private *i915)
>  		SUBTEST(igt_mmap_gpu),
>  	};
> =20
> -	if (!current->mm) {
> -		kthread_use_mm(current->active_mm);
> -		unuse_mm =3D true;
> -	}
> -
>  	ret =3D i915_live_subtests(tests, i915);
> +	if (ret)
> +		return ret;
> =20
> -	if (unuse_mm)
> -		kthread_unuse_mm(current->active_mm);
> +	if (current->mm)
> +		ret =3D i915_live_subtests(vma_tests, i915);
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu=
/drm/i915/selftests/i915_selftest.c
> index a1ccfde7380a..b6cd1063c709 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -186,6 +186,8 @@ static int __run_selftests(const char *name,
>  			   unsigned int count,
>  			   void *data)
>  {
> +	int u_pid_nr =3D i915_selftest.userspace_pid;
> +	struct mm_struct *mm =3D NULL;
>  	int err =3D 0;
> =20
>  	while (!i915_selftest.random_seed)
> @@ -201,6 +203,37 @@ static int __run_selftests(const char *name,
>  	pr_info(DRIVER_NAME ": Performing %s selftests with st_random_seed=3D0x=
%x st_timeout=3D%u\n",
>  		name, i915_selftest.random_seed, i915_selftest.timeout_ms);
> =20
> +	/**
> +	 * If the user passed a valid PID of a userspace task, then we may borr=
ow
> +	 * its address space to prepare a safe environment for the mmap selftes=
ts.
> +	 */
> +	if (u_pid_nr) {

In your previous version, you entered that section only if current->mm was=
=C2=A0
missing and there was a user provided PID.  I think that was more correct.=
=C2=A0
What happens if you then call kthread_use_mm(mm) with a valid current->mm?

Besides, a warning on missing PID when current environment needs it would=
=C2=A0
work as a verbose validation of user provided module options.=20
Please=C2=A0consider moving the u_pid_nr check into the if body, with such=
=C2=A0
warning=C2=A0added.

> +		struct pid *u_pid =3D find_get_pid(u_pid_nr);
> +		struct task_struct *task;
> +
> +		if (!u_pid) {
> +			pr_warn("Could not find PID: %d\n", u_pid_nr);
> +			goto run_tests;
> +		}
> +
> +		task =3D get_pid_task(u_pid, PIDTYPE_PID);
> +		put_pid(u_pid);
> +		if (!task) {
> +			pr_warn("Could not find userspace task for PID: %d\n", u_pid_nr);
> +			goto run_tests;
> +		}
> +
> +		mm =3D get_task_mm(task);
> +		put_task_struct(task);
> +		if (!mm) {
> +			pr_warn("Could not find address space of task with PID: %d\n", u_pid_=
nr);
> +			goto run_tests;
> +		}
> +
> +		kthread_use_mm(mm);
> +	}
> +
> +run_tests:
>  	/* Tests are listed in order in i915_*_selftests.h */
>  	for (; count--; st++) {
>  		if (!st->enabled)
> @@ -226,6 +259,11 @@ static int __run_selftests(const char *name,
>  		 st->name, err))
>  		err =3D -1;
> =20
> +	if (mm) {
> +		mmput_async(mm);
> +		kthread_unuse_mm(mm);

Please make sure whether kthread_use_mm takes a reference to mm or not.
If=C2=A0it likely does then we might be more clear if we put our reference =
to=C2=A0
mm=C2=A0taken with get_task_mm() right after kthread_use_mm() above.  If it=
=C2=A0
unlikely didn't then mmput_async(mm) would have to follow=C2=A0
kthread_unuse_mm().

Thanks,
Janusz

> +	}
> +
>  	return err;
>  }
> =20
