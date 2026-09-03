Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B52DC624DB
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 11:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71E010E09E;
	Thu,  3 Sep 2026 11:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K7alX/au";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9810E09E
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 11:01:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BF9C41356;
 Thu,  3 Sep 2026 11:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F1B1F000E9;
 Thu,  3 Sep 2026 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788433271;
 bh=TP8RSILQKR+XmNh7aggoTzVxutG4z2BgH2+EbW46NAc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=K7alX/audswUmw0euJeGHy30G0PeoGylClGIudH9WzPgxeU8AvPWiCre4yVvd/NTA
 AiZlxO3Dx5Cb6OBVGCwxHzGta6fhN5nPo2IKIDha4durr/PJQw4MhYvlb+VFRMzGCY
 VntYLNMJeUm2USpO2ykALsDfKrqRZZ65/Scy8rhw7A5IScZT0ZzTWnSnzeGMi/vqnh
 ECnCzdhBU6v/W0GjRLGwy4cQ/EUZJP0RuT+GSBmOlw7MPm9MDd43aeiuE1puEA0IFc
 uhD1cb4Jk8lQxxRVrP27joeU+89XEpCnNNrNYXtMepGwBhcGqp/ZYgg+yOoMKmSa+n
 p28T8z0gaRGrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: reset HDMI 2.1 PCON FRL state on disconnect
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260903104400.498178-1-xiaolu.xie@intel.com>
References: <20260903104400.498178-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 11:01:10 +0000
Message-Id: <20260903110111.44F1B1F000E9@smtp.kernel.org>
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
- [High] FRL training state is not cleared if the EDID is invalidated befor=
e a disconnect, causing subsequent FRL training to be skipped permanently.
--

commit 666a7a052848216c6b509f4ba1711921db6e5b40
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: reset HDMI 2.1 PCON FRL state on disconnect

When a DP-to-HDMI 2.1 PCON is disconnected, frl.is_trained remains
set from the previous connection. On reconnect, intel_dp_check_frl_training=
()
checks this flag first and returns early if set, bypassing the entire FRL
training sequence entirely.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..3643b6c4c1bc5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> +/*
> + * On disconnect, the downstream PCON and its HDMI FRL link state are go=
ne
> + * from the source's perspective. Clear the cached FRL training state so=
 that
> + * intel_dp_check_frl_training() performs a fresh FRL negotiation on the=
 next
> + * connect, rather than skipping training based on stale state.
> + */
> +static void
> +intel_dp_pcon_disconnect(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
> +		return;

[Severity: High]
Can this early return prevent clearing the FRL state if the EDID is invalid=
ated
before a disconnect?

If a transient I2C-over-AUX error occurs during a background reprobe while
the monitor is still physically connected, it can cause intel_dp_set_edid()
to fail. This failure causes drm_edid_connector_update() to be called with
NULL, which clears connector->base.display_info and sets is_hdmi to false.

If the monitor is subsequently unplugged, triggering a disconnect, this
function returns early because intel_dp_is_hdmi_2_1_sink() evaluates to
false. The frl.is_trained flag remains true.

When the monitor is reconnected, intel_dp_check_frl_training() skips
training because is_trained is still true, leading to a permanent blank
screen or severely limited resolution until a driver reload or reboot.

Should the state clearing be performed unconditionally, since the current
sink capabilities can be stale or invalidated?

> +
> +	drm_dbg_kms(display->drm,
> +		    "PCON HDMI2.1 sink disconnected, resetting FRL state (was trained =
at %d Gbps)\n",
> +		    intel_dp->frl.trained_rate_gbps);
> +	intel_dp->frl.is_trained =3D false;
> +	intel_dp->frl.trained_rate_gbps =3D 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903104400.4981=
78-1-xiaolu.xie@intel.com?part=3D1
