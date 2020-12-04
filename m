Return-Path: <SRS0=5A7x=FI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA68C433FE
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 15:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF30722C97
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Dec 2020 15:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF30722C97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EA16E196;
	Fri,  4 Dec 2020 15:51:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E246E196
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Dec 2020 15:51:37 +0000 (UTC)
IronPort-SDR: y7eEfBCFP4zQZkdfQWLZvNhhKokZqn8SMtONI+qUWsV8DX6SBRsgmOA8t6jfYFdfa5iSdQEp5l
 hWhQ+iMsQsGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="191640929"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="191640929"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 07:51:37 -0800
IronPort-SDR: vxZxKm4hu9mCfL6WbZIw6VGRZfYwemk+6NrhhY8VEtwTgudiuwklfL3wA4kVLpsuSJ+RFyfMs/
 OC3lGk0qoUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="435843025"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 04 Dec 2020 07:51:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Dec 2020 17:51:34 +0200
Date: Fri, 4 Dec 2020 17:51:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <X8pbBsHVRVV4cNfJ@intel.com>
References: <20201130091646.25576-1-anshuman.gupta@intel.com>
 <20201130091646.25576-3-anshuman.gupta@intel.com>
 <20201130152832.GB2348711@ideak-desk.fi.intel.com>
 <20201204081003.GC30377@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204081003.GC30377@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [RFC 2/2] drm/i915/display: Protect pipe_update
 against dc3co exit
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 01:40:03PM +0530, Anshuman Gupta wrote:
> On 2020-11-30 at 17:28:32 +0200, Imre Deak wrote:
> > On Mon, Nov 30, 2020 at 02:46:46PM +0530, Anshuman Gupta wrote:
> > > At usual case DC3CO exit happen automatically by DMC f/w whenever
> > > PSR2 clears idle. This happens smoothly by DMC f/w to work with flips.
> > > But there are certain scenario where DC3CO  Disallowed by driver
> > > asynchronous with flips. In such scenario display engine could
> > > be already in DC3CO state and driver has disallowed it,
> > > It initiates DC3CO exit sequence in DMC f/w which requires a
> > > dc3co exit delay of 200us in driver.
> > > It requires to protect intel_pipe_update_{update_end} with
> > > dc3co exit delay.
> > > =

> > > Cc: Imre Deak <imre.deak@intel.com>
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > =

> > To make sure that it doesn't hide the root cause (or affects unrelated
> > platforms), I'd only add locking around DC3co changes with a new lock,
> > using lock/unlock helpers in intel_display_power.c called from
> > intel_pipe_update_start/end.
> > =

> > Also please submit this patch separately, w/o the optimization in patch
> > 1/2, so we know that this change fixes the problem.
> This patch doesn't seems to fix the issue.
> Looks like there is some other set of display register updates before
> completing the dc3co exit delay beyond intel_pipe_update_start/end causin=
g this issue.

Not really sure I understand the DC3CO issue here, nor how grabbing a
mutex across the update could help.

But anyways, maybe we should just:
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm=
/i915/display/intel_display.c
index 2e2dd746921f..96276f0feddc 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -16268,8 +16268,7 @@ static void intel_atomic_commit_tail(struct intel_a=
tomic_state *state)
 =

 	drm_atomic_helper_wait_for_dependencies(&state->base);
 =

-	if (state->modeset)
-		wakeref =3D intel_display_power_get(dev_priv, POWER_DOMAIN_MODESET);
+	wakeref =3D intel_display_power_get(dev_priv, POWER_DOMAIN_MODESET);
 =

 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
 					    new_crtc_state, i) {
@@ -16415,8 +16414,8 @@ static void intel_atomic_commit_tail(struct intel_a=
tomic_state *state)
 		 * the culprit.
 		 */
 		intel_uncore_arm_unclaimed_mmio_detection(&dev_priv->uncore);
-		intel_display_power_put(dev_priv, POWER_DOMAIN_MODESET, wakeref);
 	}
+	intel_display_power_put(dev_priv, POWER_DOMAIN_MODESET, wakeref);
 	intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 =

 	/*

To get the DMC out of equation entirely for all plane updates?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
