Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DB7C636C8
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 17:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C4F600D4
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 17:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C4F600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A016E25B;
	Tue, 20 Jul 2021 17:31:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90966E25B;
 Tue, 20 Jul 2021 17:31:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="233074782"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="233074782"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 10:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="657618204"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 10:25:19 -0700
Date: Tue, 20 Jul 2021 10:14:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20210720171403.GA29967@sdutt-i7>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-46-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716201724.54804-46-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Intel-gfx] [PATCH 45/51] drm/i915/selftest: Fix workarounds
 selftest for GuC submission
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 01:17:18PM -0700, Matthew Brost wrote:
> From: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> =

> When GuC submission is enabled, the GuC controls engine resets. Rather
> than explicitly triggering a reset, the driver must submit a hanging
> context to GuC and wait for the reset to occur.
> =

> Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/gt/selftest_workarounds.c    | 130 +++++++++++++-----
>  .../i915/selftests/intel_scheduler_helpers.c  |  76 ++++++++++
>  .../i915/selftests/intel_scheduler_helpers.h  |  28 ++++
>  4 files changed, 201 insertions(+), 34 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helper=
s.c
>  create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helper=
s.h
> =

> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 10b3bb6207ba..ab7679957623 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -280,6 +280,7 @@ i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) +=3D i915_gpu_e=
rror.o
>  i915-$(CONFIG_DRM_I915_SELFTEST) +=3D \
>  	gem/selftests/i915_gem_client_blt.o \
>  	gem/selftests/igt_gem_utils.o \
> +	selftests/intel_scheduler_helpers.o \
>  	selftests/i915_random.o \
>  	selftests/i915_selftest.o \
>  	selftests/igt_atomic.o \
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu=
/drm/i915/gt/selftest_workarounds.c
> index 7ebc4edb8ecf..7727bc531ea9 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -12,6 +12,7 @@
>  #include "selftests/igt_flush_test.h"
>  #include "selftests/igt_reset.h"
>  #include "selftests/igt_spinner.h"
> +#include "selftests/intel_scheduler_helpers.h"
>  #include "selftests/mock_drm.h"
>  =

>  #include "gem/selftests/igt_gem_utils.h"
> @@ -261,28 +262,34 @@ static int do_engine_reset(struct intel_engine_cs *=
engine)
>  	return intel_engine_reset(engine, "live_workarounds");
>  }
>  =

> +static int do_guc_reset(struct intel_engine_cs *engine)
> +{
> +	/* Currently a no-op as the reset is handled by GuC */
> +	return 0;
> +}
> +
>  static int
>  switch_to_scratch_context(struct intel_engine_cs *engine,
> -			  struct igt_spinner *spin)
> +			  struct igt_spinner *spin,
> +			  struct i915_request **rq)
>  {
>  	struct intel_context *ce;
> -	struct i915_request *rq;
>  	int err =3D 0;
>  =

>  	ce =3D intel_context_create(engine);
>  	if (IS_ERR(ce))
>  		return PTR_ERR(ce);
>  =

> -	rq =3D igt_spinner_create_request(spin, ce, MI_NOOP);
> +	*rq =3D igt_spinner_create_request(spin, ce, MI_NOOP);
>  	intel_context_put(ce);
>  =

> -	if (IS_ERR(rq)) {
> +	if (IS_ERR(*rq)) {
>  		spin =3D NULL;
> -		err =3D PTR_ERR(rq);
> +		err =3D PTR_ERR(*rq);
>  		goto err;
>  	}
>  =

> -	err =3D request_add_spin(rq, spin);
> +	err =3D request_add_spin(*rq, spin);
>  err:
>  	if (err && spin)
>  		igt_spinner_end(spin);
> @@ -296,6 +303,7 @@ static int check_whitelist_across_reset(struct intel_=
engine_cs *engine,
>  {
>  	struct intel_context *ce, *tmp;
>  	struct igt_spinner spin;
> +	struct i915_request *rq;
>  	intel_wakeref_t wakeref;
>  	int err;
>  =

> @@ -316,13 +324,24 @@ static int check_whitelist_across_reset(struct inte=
l_engine_cs *engine,
>  		goto out_spin;
>  	}
>  =

> -	err =3D switch_to_scratch_context(engine, &spin);
> +	err =3D switch_to_scratch_context(engine, &spin, &rq);
>  	if (err)
>  		goto out_spin;
>  =

> +	/* Ensure the spinner hasn't aborted */
> +	if (i915_request_completed(rq)) {
> +		pr_err("%s spinner failed to start\n", name);
> +		err =3D -ETIMEDOUT;
> +		goto out_spin;
> +	}
> +
>  	with_intel_runtime_pm(engine->uncore->rpm, wakeref)
>  		err =3D reset(engine);
>  =

> +	/* Ensure the reset happens and kills the engine */
> +	if (err =3D=3D 0)
> +		err =3D intel_selftest_wait_for_rq(rq);
> +
>  	igt_spinner_end(&spin);
>  =

>  	if (err) {
> @@ -787,9 +806,26 @@ static int live_reset_whitelist(void *arg)
>  			continue;
>  =

>  		if (intel_has_reset_engine(gt)) {
> -			err =3D check_whitelist_across_reset(engine,
> -							   do_engine_reset,
> -							   "engine");
> +			if (intel_engine_uses_guc(engine)) {
> +				struct intel_selftest_saved_policy saved;
> +				int err2;
> +
> +				err =3D intel_selftest_modify_policy(engine, &saved);
> +				if(err)
> +					goto out;
> +
> +				err =3D check_whitelist_across_reset(engine,
> +								   do_guc_reset,
> +								   "guc");
> +
> +				err2 =3D intel_selftest_restore_policy(engine, &saved);
> +				if (err =3D=3D 0)
> +					err =3D err2;
> +			} else
> +				err =3D check_whitelist_across_reset(engine,
> +								   do_engine_reset,
> +								   "engine");
> +
>  			if (err)
>  				goto out;
>  		}
> @@ -1226,31 +1262,41 @@ live_engine_reset_workarounds(void *arg)
>  	reference_lists_init(gt, &lists);
>  =

>  	for_each_engine(engine, gt, id) {
> +		struct intel_selftest_saved_policy saved;
> +		bool using_guc =3D intel_engine_uses_guc(engine);
>  		bool ok;
> +		int ret2;
>  =

>  		pr_info("Verifying after %s reset...\n", engine->name);
> +		ret =3D intel_selftest_modify_policy(engine, &saved);
> +		if (ret)
> +			break;
> +
> +
>  		ce =3D intel_context_create(engine);
>  		if (IS_ERR(ce)) {
>  			ret =3D PTR_ERR(ce);
> -			break;
> +			goto restore;
>  		}
>  =

> -		ok =3D verify_wa_lists(gt, &lists, "before reset");
> -		if (!ok) {
> -			ret =3D -ESRCH;
> -			goto err;
> -		}
> +		if (!using_guc) {
> +			ok =3D verify_wa_lists(gt, &lists, "before reset");
> +			if (!ok) {
> +				ret =3D -ESRCH;
> +				goto err;
> +			}
>  =

> -		ret =3D intel_engine_reset(engine, "live_workarounds:idle");
> -		if (ret) {
> -			pr_err("%s: Reset failed while idle\n", engine->name);
> -			goto err;
> -		}
> +			ret =3D intel_engine_reset(engine, "live_workarounds:idle");
> +			if (ret) {
> +				pr_err("%s: Reset failed while idle\n", engine->name);
> +				goto err;
> +			}
>  =

> -		ok =3D verify_wa_lists(gt, &lists, "after idle reset");
> -		if (!ok) {
> -			ret =3D -ESRCH;
> -			goto err;
> +			ok =3D verify_wa_lists(gt, &lists, "after idle reset");
> +			if (!ok) {
> +				ret =3D -ESRCH;
> +				goto err;
> +			}
>  		}
>  =

>  		ret =3D igt_spinner_init(&spin, engine->gt);
> @@ -1271,25 +1317,41 @@ live_engine_reset_workarounds(void *arg)
>  			goto err;
>  		}
>  =

> -		ret =3D intel_engine_reset(engine, "live_workarounds:active");
> -		if (ret) {
> -			pr_err("%s: Reset failed on an active spinner\n",
> -			       engine->name);
> -			igt_spinner_fini(&spin);
> -			goto err;
> +		/* Ensure the spinner hasn't aborted */
> +		if (i915_request_completed(rq)) {
> +			ret =3D -ETIMEDOUT;
> +			goto skip;
> +		}
> +
> +		if (!using_guc) {
> +			ret =3D intel_engine_reset(engine, "live_workarounds:active");
> +			if (ret) {
> +				pr_err("%s: Reset failed on an active spinner\n",
> +				       engine->name);
> +				igt_spinner_fini(&spin);
> +				goto err;
> +			}
>  		}
>  =

> +		/* Ensure the reset happens and kills the engine */
> +		if (ret =3D=3D 0)
> +			ret =3D intel_selftest_wait_for_rq(rq);
> +
> +skip:
>  		igt_spinner_end(&spin);
>  		igt_spinner_fini(&spin);
>  =

>  		ok =3D verify_wa_lists(gt, &lists, "after busy reset");
> -		if (!ok) {
> +		if (!ok)
>  			ret =3D -ESRCH;
> -			goto err;
> -		}
>  =

>  err:
>  		intel_context_put(ce);
> +
> +restore:
> +		ret2 =3D intel_selftest_restore_policy(engine, &saved);
> +		if (ret =3D=3D 0)
> +			ret =3D ret2;
>  		if (ret)
>  			break;
>  	}
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/d=
rivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> new file mode 100644
> index 000000000000..91ecd8a1bd21
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -0,0 +1,76 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright =A9 2018 Intel Corporation
> + */
> +
> +//#include "gt/intel_engine_user.h"
> +#include "gt/intel_gt.h"
> +#include "i915_drv.h"
> +#include "i915_selftest.h"
> +
> +#include "selftests/intel_scheduler_helpers.h"
> +
> +#define REDUCED_TIMESLICE	5
> +#define REDUCED_PREEMPT		10
> +#define WAIT_FOR_RESET_TIME	1000
> +
> +int intel_selftest_modify_policy(struct intel_engine_cs *engine,
> +				 struct intel_selftest_saved_policy *saved)
> +
> +{
> +	int err;
> +
> +	saved->reset =3D engine->i915->params.reset;
> +	saved->flags =3D engine->flags;
> +	saved->timeslice =3D engine->props.timeslice_duration_ms;
> +	saved->preempt_timeout =3D engine->props.preempt_timeout_ms;
> +
> +	/*
> +	 * Enable force pre-emption on time slice expiration
> +	 * together with engine reset on pre-emption timeout.
> +	 * This is required to make the GuC notice and reset
> +	 * the single hanging context.
> +	 * Also, reduce the preemption timeout to something
> +	 * small to speed the test up.
> +	 */
> +	engine->i915->params.reset =3D 2;
> +	engine->flags |=3D I915_ENGINE_WANT_FORCED_PREEMPTION;
> +	engine->props.timeslice_duration_ms =3D REDUCED_TIMESLICE;
> +	engine->props.preempt_timeout_ms =3D REDUCED_PREEMPT;
> +
> +	if (!intel_engine_uses_guc(engine))
> +		return 0;
> +
> +	err =3D intel_guc_global_policies_update(&engine->gt->uc.guc);
> +	if (err)
> +		intel_selftest_restore_policy(engine, saved);
> +
> +	return err;
> +}
> +
> +int intel_selftest_restore_policy(struct intel_engine_cs *engine,
> +				  struct intel_selftest_saved_policy *saved)
> +{
> +	/* Restore the original policies */
> +	engine->i915->params.reset =3D saved->reset;
> +	engine->flags =3D saved->flags;
> +	engine->props.timeslice_duration_ms =3D saved->timeslice;
> +	engine->props.preempt_timeout_ms =3D saved->preempt_timeout;
> +
> +	if (!intel_engine_uses_guc(engine))
> +		return 0;
> +
> +	return intel_guc_global_policies_update(&engine->gt->uc.guc);
> +}
> +
> +int intel_selftest_wait_for_rq(struct i915_request *rq)
> +{
> +	long ret;
> +
> +	ret =3D i915_request_wait(rq, 0, WAIT_FOR_RESET_TIME);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/d=
rivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> new file mode 100644
> index 000000000000..f30e96f0ba95
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2014-2019 Intel Corporation
> + */
> +
> +#ifndef _INTEL_SELFTEST_SCHEDULER_HELPERS_H_
> +#define _INTEL_SELFTEST_SCHEDULER_HELPERS_H_
> +
> +#include <linux/types.h>
> +
> +struct i915_request;
> +struct intel_engine_cs;
> +
> +struct intel_selftest_saved_policy
> +{
> +	u32 flags;
> +	u32 reset;
> +	u64 timeslice;
> +	u64 preempt_timeout;
> +};
> +
> +int intel_selftest_modify_policy(struct intel_engine_cs *engine,
> +				 struct intel_selftest_saved_policy *saved);
> +int intel_selftest_restore_policy(struct intel_engine_cs *engine,
> +				  struct intel_selftest_saved_policy *saved);
> +int intel_selftest_wait_for_rq( struct i915_request *rq);
> +
> +#endif
> -- =

> 2.28.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
