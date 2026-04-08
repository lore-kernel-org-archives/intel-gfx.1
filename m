Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA374FD5F9C
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Apr 2026 09:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4721910E5C7;
	Wed,  8 Apr 2026 09:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQRGBXg4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245D310E5C7
 for <intel-gfx@lists.freedesktop.org>; Wed,  8 Apr 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775640059; x=1807176059;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9BnBqmOjXtPvIE1QWmo/b6Hpcvng0wYVPTKgqqaZskA=;
 b=WQRGBXg4W3mZ+Ki6gtSyI3RmkjK+VGV5nl/JA0igt6YnnL6JSA8kBqfS
 5/4YwwYgkHSTdTA2U5rkxthcUsOoTs4a4/ajY6VUqXTVGUAuHix5LKNxf
 U+pefzM0C03jQpx2BWf9N1QM1saiYbiSMHl3lxG+uTEhW/Kz565ZPILR6
 2Wms58LkepVd5bny75f2PuL1ODjZny7jDkN5OmxvELf0Kq2USkZ9Ol5jD
 3Kg/heEsb7f0DkCNU5DnHy/v3z20ed/Q4zlNBeqnEYlABCkfrd0gx5C+0
 0Rv1bKmf1DDpf/1FyjH67KYiTfM7b5gFSGuIQqx2y+Ne3mj+OLKvZwPD1 Q==;
X-CSE-ConnectionGUID: HekclO+KRzCHc0hgdQ23Ug==
X-CSE-MsgGUID: b6UTb3UaQJ2MUx5Nj1z1xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87316918"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="87316918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:20:59 -0700
X-CSE-ConnectionGUID: BhTkQzRJRJCNSeooo+wHow==
X-CSE-MsgGUID: LxqrUUtQRsS7V3lG/HNmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="224125537"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.38])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:20:57 -0700
Message-ID: <84bf4789b5e801b719505da73ca95efb6b3c1be7.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/2] drm/i915/selftests: Prevent userspace mapping
 invalidation
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka	
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Date: Wed, 08 Apr 2026 11:20:54 +0200
In-Reply-To: <20260408083034.2060372-2-krzysztof.karas@intel.com>
References: <20260408083034.2060372-1-krzysztof.karas@intel.com>
 <20260408083034.2060372-2-krzysztof.karas@intel.com>
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

I found it not quite correct what I suggested before, see below.

On Wed, 2026-04-08 at 08:30 +0000, Krzysztof Karas wrote:
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
> Prevent this by adding a PID parameter to a trusted task, so its
> mm struct may be used if needed.
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
> v4:
>  * Revert !current->mm check. (Janusz, Sebastian)
>  * Drop refernce to mm sooner. (Janusz)
>  * Ensure kthread_use_mm did its job. (Janusz)
>=20
>  drivers/gpu/drm/i915/i915_selftest.h          |  1 +
>  .../gpu/drm/i915/selftests/i915_selftest.c    | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/=
i915_selftest.h
> index 72922028f4ba..e29ca298e7eb 100644
> --- a/drivers/gpu/drm/i915/i915_selftest.h
> +++ b/drivers/gpu/drm/i915/i915_selftest.h
> @@ -35,6 +35,7 @@ struct i915_selftest {
>  	unsigned long timeout_jiffies;
>  	unsigned int timeout_ms;
>  	unsigned int random_seed;
> +	unsigned int userspace_pid;
>  	char *filter;
>  	int mock;
>  	int live;
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu=
/drm/i915/selftests/i915_selftest.c
> index 8460f0a70d04..45fe750b799d 100644
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
> @@ -201,6 +203,50 @@ static int __run_selftests(const char *name,
>  	pr_info(DRIVER_NAME ": Performing %s selftests with st_random_seed=3D0x=
%x st_timeout=3D%u\n",
>  		name, i915_selftest.random_seed, i915_selftest.timeout_ms);
> =20
> +	/**
> +	 * If we are running in a kthread on a multi NUMA system and the user p=
assed
> +	 * a valid PID of a userspace task, then we may borrow its address spac=
e
> +	 * to prepare a safe environment for the mmap selftests.
> +	 */
> +	if (!current->mm) {
> +		struct pid *u_pid;
> +		struct task_struct *task;
> +
> +		if (!u_pid_nr) {
> +			pr_warn("No current->mm and no PID provided to safely borrow userspac=
e memory from.\n"
> +				"This may lead to switching off tests requiring that for mappings");

Most selftests don't need current->mm, while the warning emitted from here=
=C2=A0
will unnecessary trigger CI dmesg-warn result for any selftest.  I propose=
=C2=A0
to decrease severity to INFO, and instead, add a similar warning to the=C2=
=A0
second patch.

If a user provides a PID then the warnings below are OK.

Thanks,
Janusz

> +			goto run_tests;
> +		}
> +
> +		u_pid =3D find_get_pid(u_pid_nr);
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
> +		mmput_async(mm);
> +		if (unlikely(!current->mm)) {
> +			pr_warn("Could not set mm as current->mm\n");
> +		}
> +	}
> +
> +run_tests:
>  	/* Tests are listed in order in i915_*_selftests.h */
>  	for (; count--; st++) {
>  		if (!st->enabled)
> @@ -226,6 +272,9 @@ static int __run_selftests(const char *name,
>  		 st->name, err))
>  		err =3D -1;
> =20
> +	if (mm)
> +		kthread_unuse_mm(mm);
> +
>  	return err;
>  }
> =20
> @@ -507,6 +556,8 @@ void igt_hexdump(const void *buf, size_t len)
>  module_param_named(st_random_seed, i915_selftest.random_seed, uint, 0400=
);
>  module_param_named(st_timeout, i915_selftest.timeout_ms, uint, 0400);
>  module_param_named(st_filter, i915_selftest.filter, charp, 0400);
> +module_param_named(st_userspace_pid, i915_selftest.userspace_pid, uint, =
0400);
> +MODULE_PARM_DESC(st_userspace_pid, "For usage in tests that map userspac=
e memory and require address space with controllable lifetime.");
> =20
>  module_param_named_unsafe(mock_selftests, i915_selftest.mock, int, 0400)=
;
>  MODULE_PARM_DESC(mock_selftests, "Run selftests before loading, using mo=
ck hardware (0:disabled [default], 1:run tests then load driver, -1:run tes=
ts then leave dummy module)");
