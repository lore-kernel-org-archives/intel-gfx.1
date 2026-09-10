Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EBAC79FB9
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD6710F4BF;
	Thu, 10 Sep 2026 14:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Si8uWBBD";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A45010E1B4
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 04:43:19 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-86927f9ba4dso912753b3a.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 09 Sep 2026 21:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789015399; cv=none;
 d=google.com; s=arc-20260327;
 b=e1Z0K3qKiqMLbhxxes1JZM0IpgpuWZSImwweMBzmS181Dhx3tznid9wlFVGsYAah2s
 dkpM529Tu9WIqNFovd50fNPNFEcB7LAnFIbxMOZIug8rPXju1yo2rZ5i9y6mzYqC7YTC
 PRkTPNdqMZ9TocxinFPLocw7XSbEjzBjmLPYfpxOrmjfyEdHyMYqkNyymplAVec0HL+u
 EZkSjeXLI9Lkx69O1xGfcA9TV8u82UI2sDpygvh8zaM3UtIUNX0TMwfrPbh1MMgriuEv
 QD9bCN4koTN2mEujHrpsBSRxPGr7Iv16W8YTJH8Ir0cR9aqCppLnbAXWJb3/EJotXlyW
 EQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GL7Z6EHfnS8D/PgKYn+HCTKG9Da4Y+Wbx/C8FKsg3nQ=;
 fh=v8el1eh0ATiaIbHZ6o3ykSGwtQ9eZWwTj7Jre8Mu7O8=;
 b=X3wMaWGS+ygZ8V6Lur3yRrJbkRzbRTobL9yv83E+xW/dC+iTJSdwAo3U2U0as7/Dqy
 F0fSQQkL5SZayjLrjgQurBJpDsCuUnUE9sBu0Lu0780WeDThSabIeL+cKat+BB8Xdx25
 arQGRTAu1NltKwoeQMAQTp2GtecEjXgEbvU8Folq5SGOAo2CoNsieFSWaVJU3wYK/5Xp
 x2wLzIzbm5ETeE29q/D7Qgnx2xcvjeO1F3UgTCgrNCAUSFY8sU/iFkUCBS/Fv8pQ3Q0s
 04WRS0wNt79gLcG7B5GARzfOf5z+pi66/9g+f3tkYffSguTI/XImh6W0dduxOqqvXEmM
 MHTA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789015399; x=1789620199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GL7Z6EHfnS8D/PgKYn+HCTKG9Da4Y+Wbx/C8FKsg3nQ=;
 b=Si8uWBBDlK8LD5Ih75qTdC2gzcjqv+t3Cs9ukK/BwvLhGJ/t3b/vb4Oy+GnD++dsdP
 vzwrd+OpJWz3G8BQ8Uom/q7BcQSrhG5PsG1fwEuBk8wVeveMw46y6zReziBegeiUMx/8
 lKSIqIVNJTbCI9f43CDPK/MpYY8Q7WUhCi47YQRrv0aGnB/jeGEj695IgitDkr8jB5an
 4OTGGWPDnHBxcLFn3TCOWK1cVqiWW6XdxISGGrGFrNcoVg0zIvrKQqrymfB9enL4fZun
 s5esBoiWo44Imjz9DRfG8lTHW1EX8sH97ZXbxLsovWw8RhJtQmxh2SW+mndLWv5M2RQD
 vy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789015399; x=1789620199;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GL7Z6EHfnS8D/PgKYn+HCTKG9Da4Y+Wbx/C8FKsg3nQ=;
 b=JgtniB/MMXRiVUnoLut1QIhlAkgcMs4dT4nCqkMDdcRRanXZVJszP+nDEyzp2/7453
 Ao7sf4FKkKc+Z/o98ThgOMDIsl/v4/u/pjgpS0SUWTBoTV0KRe4EOHb0K63UUHYlMy0+
 JOn7jorphcnWqX4thw34SWxGvfd7N2sP18fxVneJ6WIz1lxbvKM+JJVo6ydZLYxg+FCT
 cOO+MaLZvNNg493h5DIhi1/Scq5hti2EFFBIm9Pgs/jetj+WHujT6szfpUTEw564y8VQ
 zGTVEHPIHdJuOJ7w+ojvW0R3nRSXY7Nn6Mex4X8Rl6JcEZI6Jvb4Q9Rb6Vp5mF3WSG5l
 /H5w==
X-Gm-Message-State: AFuF++nwurscke/6hME5FdVkIMv1x3YM0re+0QIEWy0sfYFfnvDFaQ9P
 YI0KDI1AG9VAx0HwxIbSB6Pnxr8KRf7NZsNqD+oPLqFZ1+OmyvPdC6jhPvKOeiGJNkOjMN4ujFP
 0pwJEwC+wCE/bODq7U1ydvCbtEs3eXHF7exhP
X-Gm-Gg: AYBFou3jtWkBDP0eSfvhh5ktgR133hXHJtkL5Uprps8KshN/HyGNbBacK/5rcjl3fXB
 012ruphdRMt9ss550X/jebQ5PmgVSTStnOTH0SPNneNZ+A9ast9Ui/pLlWZKHbo0hTVtP68qMN2
 6tGKSZ0zbVrM/vaYdF/vf2+fOYmpvRCs7iAe/b5NUL/Urt5SoU924iDdtHmVhX464Kxe3puOO/v
 Y3q0XF4b0QU9fQNpC3pAouX7XwJhugzngZMq4aTHs+UH8ThGxn8RFFncMTNGLJ/fEGrA7sbMFoR
 QiH2NpbakMxTDTlzsZ51cb6dWx5DRN2NZRmlxWQBWr9Cupd9wphCM31B2UjAU0PzgsnTMNll+3R
 cN1OedFVa1B6l1ynQCpYS
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id
 adf61e73a8af0-3da3a08ecdbmr62659535637.17.1789015398804; Wed, 09 Sep 2026
 21:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxXSL-D=cJ8ne9Lc=W=746TZgyXVVYqWm=kP=CWj8D+M6JjRA@mail.gmail.com>
 <CH3PR11MB7300D5961C982BA2B040675FBAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB7300D5961C982BA2B040675FBAB12@CH3PR11MB7300.namprd11.prod.outlook.com>
From: Metrical revel <metricalrevel@gmail.com>
Date: Wed, 9 Sep 2026 23:43:07 -0500
X-Gm-Features: AcwNN1UPyh261lwdadQLK8NVCQdR0o3xWyW5Y9HeGPptMo1jd2_e1516Xtx-2jY
Message-ID: <CAAxXSL9JUB9d1CqVx-nY-DwskyFfu4kUOsyNf4qPpj_hz-iS_Q@mail.gmail.com>
Subject: Re: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 10 Sep 2026 14:24:20 +0000
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

Hi Arun,

Tested v6 on my HP Victus 15 (Raptor Lake-P), compiled against
linux-zen v7.2.2 with the v6 patch applied.

Ran multiple suspend/resume cycles (both `systemctl suspend` and lid
close) with drm.debug=3D0x1e:

    journalctl -k -b 0 | grep -c "Failed to enable link training"
    0

Display resumed instantly in every cycle, ~2s to fully exit deep
suspend. No trace of the eDP link-training failure that was
consistently reproducible before this patch (or on unpatched
7.2.2).

Also checked i915.CI.Full for v6 -- only 2 flagged regressions, both
unrelated HDMI cursor tests (kms_cursor_edge_walk, pipe-d-hdmi-a-4),
nothing on eDP this time. Looks like the read_byte/timeout issue
from v5 is resolved.

One thing worth flagging alongside Sashiko's bitmask comment before
this lands: the wake sequence writes DP_SET_POWER_D0 twice --

    drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
    fsleep(1000);
    drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);

The comment right above it still says "wake it up to D3_AUX_ON", and
earlier revisions (v3/v4) wrote D3_AUX_ON on the second call per
DP2.1 sec 2.3.1.2. Looks like it may have been dropped during the v5
simplification. It didn't stop the fix from working for my case, but
might matter for panels that actually need the D3_AUX_ON state.

Tested-by: Mathias Sebasti=C3=A1n Vargas Silva <metricalrevel@gmail.com>

Thanks,
Mathias

El lun, 7 sept 2026 a la(s) 10:20=E2=80=AFp.m., Murthy, Arun R
(arun.r.murthy@intel.com) escribi=C3=B3:
>
> Mathias,
> There seems to a bug in the poll with the replacement of readb with read_=
byte related to timeout. I will have to fix that and also received few comm=
ents as well. Let me fix those and will post a new version which you can us=
e for testing.
>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>
> > -----Original Message-----
> > From: Metrical revel <metricalrevel@gmail.com>
> > Sent: Tuesday, September 8, 2026 2:23 AM
> > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org
> > Subject: Re: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
> >
> > Hi Arun,
> >
> > (Replying by email since patchwork doesn't support direct comments =E2=
=80=94
> > apologies if this duplicates my GitLab note.)
> >
> > Noticed v5's i915.CI.BAT is passing now =E2=80=94 good sign the build i=
ssue is resolved.
> >
> > Before I compile and test v5 on my hardware for a Tested-by, I wanted t=
o flag
> > something from i915.CI.Full that looks a bit more specific than the usu=
al noise
> > we saw on v1/v3:
> >
> > igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-edp-1:
> >     shard-mtlp: PASS -> ABORT +1 other test abort
> >
> > igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-d-edp-1:
> >     shard-mtlp: PASS -> DMESG-WARN
> >
> > Unlike the earlier CI flags (which were all in unrelated subsystems lik=
e
> > gem_ccs/kms_plane_lowres), these two are both on eDP-1 specifically, sa=
me
> > shard, same test family, both regressing from PASS. Is this known/expec=
ted
> > noise on shard-mtlp, or worth digging into given it touches the exact c=
onnector
> > this patch modifies?
> >
> > Happy to go ahead and test v5 on my hardware for a Tested-by either way=
 =E2=80=94
> > just didn't want to give a Tested-by without flagging this first.
> >
> > Thanks,
> > Mathias
