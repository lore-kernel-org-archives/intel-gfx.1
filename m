Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F1CC982D6
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 14:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D55110E4D1;
	Thu, 17 Sep 2026 14:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9pNlfSh";
	dkim-atps=neutral
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEB910E4D1
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2026 14:06:59 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so5540435e9.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2026 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789654017; x=1790258817; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UkSdkOEDch6xPGt5yKQldA8SKIMYGxjZsziBIdwYmug=;
 b=W9pNlfShC0ZPFWTZxxam/KF4OdNh1+TiXG7FTe9vXCwU5etMIe1Zj2sFRlr97d5oVq
 BYJuQsABl1CP5Otu19NXkaL3EB03s12jTa/9f3omj0GJNvizPDd0XU3KPW4uH8kPs5Wt
 TMQPsa0tU3n8GVPGE4iOZTCBPWGiCkV3+5zPYQj5bNKR8vX/yUuuW5jxsaMFJP7/XRal
 MJajuEc3NTw6As49s3Dh1XRTKAkk0puIXFVLIQc+hEo9/rNeFFM/nnJLrLyLMuVbPTKj
 ZBJ739jJUdUcz1pKJKbPcOYLfcOtcOMUBZTccmeXDD2aE4A6RMEaY67KvYjJWFCk7ApS
 QsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789654017; x=1790258817;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UkSdkOEDch6xPGt5yKQldA8SKIMYGxjZsziBIdwYmug=;
 b=aruzpHF/GXwi/zkfCBMvB7bBf2fYw++2WER0+lkFX7Ex0A35pRpLg69zsnVYKgAwty
 hJ8eNVNrFr/FM23QXjgUP0jSVD94LOhaKRli4J9eUvIY2BWK/GcJQAUZUVNXT+j0jD+Q
 nqsEkbg8AQ9kLynnNoBNH477/uAV/Dx5jdzPZ5SKvGoaMSuodKI9bo9d85RdTAQZsqdK
 +Gnrlnk/CcKo8w7EP7jazoicXbJr1JFOvz8qBT3CIpPDw7eBIddyFgryh5nWS4My04TI
 ih7YBHqYgJhRJXIiHVi4j4yM0XZjZlKNDrYYSoUG2q3MOdmFmQ9v79dLED9tq19NrJoA
 ynSg==
X-Gm-Message-State: AFuF++mZI7vbIW6Wb/b9bu/6/EvTHXtW3+e48ZlRVpElYDNHQiPuOUZG
 YqCLR22A7wQB4sUDUgbCjDXt95eA02BzqSwAKQa+YO/NcTET4eTP/VznzBEtQzmlJtyX+w==
X-Gm-Gg: AYBFou0lKY4lewxQi/aC4e3NCAvbWu+pRoFuN6rdOLDy0NWqhepIgWDxqYGVCRVGKPU
 KJI93vRDl8zSxDqHfgiXALhURhMSouhf/uo8LXr5WZmFz+Bjpj5zGwGYZRieAcTQHqt11t7ds9p
 lplCECRMJAumz5Y7lS925aLT+C9u1DUdyLWiVBpuFL4Iq1JyKOl+J1hNdcN6wfPEKH7RCGTAXgj
 NNeWIsIoYneXRuUL1w4SsfCyuwsed8y9lvLTjzUHfkDx5A/22ig85eSB11X0m0mvF7VP1K8eKIe
 sNMXO+ekRK0DjaoQ7DET2IPLJ/Oq3dvTa0vXiNefOOlrALnqqvsRAmkB7EweCJg4ZvtdfyNXPSh
 +VJ/n3xuYZn8djEoDfcGB+0mCOSHKcRUiNJY46c/nzMuoKm3cfYHBFIss1Sub8NdbGoXpnVh4YO
 3R339o7ACUeSz0uWI6xDHgZpD0qju1Vw3ejupKQooNXHaDu2lfR3+XODXqNlwKdJfYTCQ=
X-Received: by 2002:a05:600c:3b01:b0:49c:fc89:59cb with SMTP id
 5b1f17b1804b1-49eac46390amr81581005e9.5.1789654017312; 
 Thu, 17 Sep 2026 07:06:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1fe7esm16289137f8f.6.2026.09.17.07.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 07:06:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 17:06:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: [bug report] drm/i915/dp_mst: Fix configuring TUs for a disconnected
 stream
Message-ID: <aqvz_dSzr7AbUp9j@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Imre Deak,

Commit ee00f8fbb2b2 ("drm/i915/dp_mst: Fix configuring TUs for a
disconnected stream") from Sep 7, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/i915/display/intel_link_bw.c:69 intel_link_bw_init_limits()
	error: we previously assumed 'crtc_state' could be null (see line 67)

drivers/gpu/drm/i915/display/intel_link_bw.c
    53 void intel_link_bw_init_limits(struct intel_atomic_state *state,
    54                                struct intel_link_bw_limits *limits)
    55 {
    56         struct intel_display *display = to_intel_display(state);
    57         enum pipe pipe;
    58 
    59         limits->link_dsc_pipes = 0;
    60         limits->bpp_limit_reached_pipes = 0;
    61         for_each_pipe(display, pipe) {
    62                 struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
    63                 const struct intel_crtc_state *crtc_state =
    64                         intel_atomic_get_new_crtc_state(state, crtc);
    65                 int forced_bpp_x16 = get_forced_link_bpp_x16(state, crtc);
    66 
    67                 if ((state->base.duplicated && crtc_state) ||
                                                      ^^^^^^^^^^
Check for NULL

    68                     intel_dp_mst_stream_disconnected(state, crtc)) {
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Possible this also implied crtc_state is non-NULL?  It looks more like
intel_dp_mst_stream_disconnected() assumes that crtc_state is non-NULL...

--> 69                         limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
                                                           ^^^^^^^^^^^^
Unchecked dereference.

    70                         if (intel_dsc_enabled_on_link(crtc_state))
    71                                 limits->link_dsc_pipes |= BIT(pipe);
    72                 } else {
    73                         limits->max_bpp_x16[pipe] = INT_MAX;
    74                 }
    75 
    76                 if (forced_bpp_x16)
    77                         limits->max_bpp_x16[pipe] = min(limits->max_bpp_x16[pipe], forced_bpp_x16);
    78         }
    79 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
