Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E9E7E35E
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Apr 2026 09:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848C610E289;
	Fri,  3 Apr 2026 09:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gfmsj4ZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA710E289
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Apr 2026 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775210256; x=1806746256;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/8G5WPfgx6maeRN83fTE+5Itazsy5Zh6ePAEMMLSBcw=;
 b=Gfmsj4ZFrQQQGgG5emN1fDiNgZOv/53kbIKQVMuQ41LnO5vms/9hGlTh
 8Sg/tiCYutJhOVpINKLWCzPLu/tiPIU3yVBdT0mK51d7I1qMunW7e127f
 8jxNeXWOnvx7fk0ojcEPpllIogNHX42r7vqRTD8WLEMWxCTgigtVOfRtJ
 ePABHNObWYWNB5/Nlr2vo9hFsZslz34vDS7tqfGZcuZWgGWh2wPyKf66W
 g59+jOjs8KKMG0Q8JFxUsKXg+kioDKqhlm3yGG/IlB7Q70JA57Ian5Onx
 E3wzyygWrSMu2SQHmMg9+avCbjRfbi0IjOH8gBkQsNKT/8UNlKF1RrVIp A==;
X-CSE-ConnectionGUID: mveu7QGgQN28wAG+iUEf5Q==
X-CSE-MsgGUID: k7/aWjpRTeev6yz8GHXHew==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75996699"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="75996699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 02:57:36 -0700
X-CSE-ConnectionGUID: cWcYCIwbRGOwxCCUwpHIxw==
X-CSE-MsgGUID: G9xmZ8dOR2WNR9DV2v0Ldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="231259878"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.219])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 02:57:33 -0700
Message-ID: <7707ddbfcbd74aec7d942bab1a5bd4cdbb2fe5ab.camel@linux.intel.com>
Subject: Re: [RFC v3 1/2] drm/i915/selftests: Add userspace PID parameter
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka	
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Date: Fri, 03 Apr 2026 11:57:30 +0200
In-Reply-To: <20260403090019.1933036-2-krzysztof.karas@intel.com>
References: <20260403090019.1933036-1-krzysztof.karas@intel.com>
 <20260403090019.1933036-2-krzysztof.karas@intel.com>
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

On Fri, 2026-04-03 at 09:00 +0000, Krzysztof Karas wrote:
> Currently, memory management tests using VMAs for object mapping
> are not guaranteed to execute in completely safe environment of
> user process in kernel context.
>=20
> Since these tests may execute in kworker, for example on
> multi-cell NUMA systems, their process would not get its own
> userspace memory, so it'd borrow mm_struct from a process
> previously handled by the scheduler (current->active_mm).
> The test does not control the lifetime of that process and its
> address space, so on occasion it could borrow memory that is
> being cleaned up or that would be cleaned up during test
> execution.
>=20
> Add a new parameter to i915 to let users running these tests
> pass a PID of trusted userspace process to ensure the mappings
> will always be utilized in a stable and predictable environment.
>=20
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

I would still prefer this combined with a part of next patch that uses the=
=C2=A0
user provided PID for acquiring a missing current->mm, and the other part,
the one that skips selected test cases if current->mm is missing,=C2=A0spli=
t=C2=A0
into a separate patch.  That way, both would be self-contained and could=C2=
=A0
be=C2=A0reverted=C2=A0independently if needed.  But anyway,

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/i915_selftest.h           | 1 +
>  drivers/gpu/drm/i915/selftests/i915_selftest.c | 2 ++
>  2 files changed, 3 insertions(+)
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
> index 8460f0a70d04..a1ccfde7380a 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -507,6 +507,8 @@ void igt_hexdump(const void *buf, size_t len)
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
