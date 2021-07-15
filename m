Return-Path: <SRS0=YxzO=MH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E083C07E96
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Jul 2021 06:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B37061358
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Jul 2021 06:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B37061358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C142B6E17F;
	Thu, 15 Jul 2021 06:13:15 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF786E17F
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Jul 2021 06:13:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="271589027"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="271589027"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:13:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="562683087"
Received: from thihoan5-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.66.46])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:13:12 -0700
Date: Wed, 14 Jul 2021 23:13:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20210715061311.5ggobqa5avi6yjwz@ldmartin-desk2>
References: <20210715050507.31176-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715050507.31176-1-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/step: Add macro magic for
 handling steps
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 10:05:06PM -0700, Anusha Srivatsa wrote:
>With the addition of stepping info for
>all platforms, lets use macros for handling them
>and autogenerating code for all steps at a time.
>
>Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/intel_step.c | 14 ++++++++++++
> drivers/gpu/drm/i915/intel_step.h | 37 +++++++++++++++++++------------
> 2 files changed, 37 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
>index 9fcf17708cc8..26f6b1d376e1 100644
>--- a/drivers/gpu/drm/i915/intel_step.c
>+++ b/drivers/gpu/drm/i915/intel_step.c
>@@ -182,3 +182,17 @@ void intel_step_init(struct drm_i915_private *i915)
>
> 	RUNTIME_INFO(i915)->step = step;
> }
>+
>+#define STEP_NAME_CASE(name)	\
>+	case STEP_##name:	\
>+		return #name;
>+
>+const char *intel_step_name(enum intel_step step)
>+{
>+	switch(step) {
>+	STEP_NAME_LIST(STEP_NAME_CASE);
>+
>+	default :
>+		return "**";
>+	}
>+}
>diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
>index 88a77159703e..f6641e2a3c77 100644
>--- a/drivers/gpu/drm/i915/intel_step.h
>+++ b/drivers/gpu/drm/i915/intel_step.h
>@@ -15,30 +15,39 @@ struct intel_step_info {
> 	u8 display_step;
> };
>
>+#define STEP_ENUM_VAL(name)  STEP_##name,
>+
>+#define STEP_NAME_LIST(func)		\
>+	func(A0)			\
>+	func(A1)			\
>+	func(A2)			\
>+	func(B0)			\
>+	func(B1)			\
>+	func(B2)			\
>+	func(C0)			\
>+	func(C1)			\
>+	func(D0)			\
>+	func(D1)			\
>+	func(E0)			\
>+	func(F0)			\
>+	func(G0)			\
>+	func(H0)			\
>+	func(I0)			\
>+	func(I1)			\
>+	func(J0)
>+
> /*
>  * Symbolic steppings that do not match the hardware. These are valid both as gt
>  * and display steppings as symbolic names.
>  */
> enum intel_step {
> 	STEP_NONE = 0,
>-	STEP_A0,
>-	STEP_A2,
>-	STEP_B0,
>-	STEP_B1,
>-	STEP_C0,
>-	STEP_D0,
>-	STEP_D1,
>-	STEP_E0,
>-	STEP_F0,
>-	STEP_G0,
>-	STEP_H0,
>-	STEP_I0,
>-	STEP_I1,
>-	STEP_J0,
>+	STEP_NAME_LIST(STEP_ENUM_VAL)
> 	STEP_FUTURE,
> 	STEP_FOREVER,
> };
>
> void intel_step_init(struct drm_i915_private *i915);
>+const char *intel_step_name(enum intel_step step);
>
> #endif /* __INTEL_STEP_H__ */
>-- 
>2.32.0
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
