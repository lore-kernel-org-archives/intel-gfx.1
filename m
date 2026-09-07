Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A178C79F99
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC7810ED2B;
	Tue,  8 Sep 2026 18:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1f548Bl";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE5B10E045
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 20:53:23 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3969e82ff8fso3997517a91.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 07 Sep 2026 13:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788814403; cv=none;
 d=google.com; s=arc-20260327;
 b=sAlFLywIjSZpTReDd1lJVRVzSFZBsRfyP2Oz9/Iy0nF88zGKz525VRJrJR34vl3DGA
 v18Akd9n7f6n7HNXlfaZp9UozzM2VPSC1jtSpQe8jyzXlp0viuuN03Oc8hBo2nL0t0ok
 ToDQXkZ8qZ94N5Ttlh8NPeUjD4qIR8yCPell05GSnYTP51X+D5Z4XDQC+vL7CIJ4uz7D
 1wUMH3a0dz2wMRnN5e9JjTJTiO/YiFo9uIlyZcGFR3PJY6VAinp84nGnp083s3x2Vg0c
 XtzK4WxFxhWk2Yd1UBNbp3dHnpGAgoZByacOQo1aYYBQe0iCF5VEAZRUHo+Mhtr86qQL
 mxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=hHTlsghc6bI82mwngIzGXI4ncoEpEEoe7tYa8QxD/gk=;
 fh=8nNxbrlOlF8vFeAMV64rIYfim/+PdVZC/AXtnI6pqdw=;
 b=f3cvNjcQvK8PcX2cpz8QiXrZ8lnpTUjr3DMl22vdzsaDY20vr8SYeGQVaBkT6yX8JF
 y3VtCpl+J06YqT9qS4ZzIHTMcK63Gmfe2VKV/w3FgEZmmgluWPZWfCduETDDG+sLsb0E
 EwG2SmDFg5pQbu4br9yvGi9gTV9C4woEaniTz0msNvJHcldKHPIr0UZJSIiI9HZaLWBg
 4V7W2BFa2ajpasasubpxePc5po57bheQ87+SLW5SFYuh9MUzsxKDMSezRsbTTbDZ3ZZR
 klpQnDjSbL3BpAwTHG0ve3Vd0GK/KeU614k3TysbbQ/ZWyy+e63My5Zi3lZoKflBTaH1
 siZg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788814403; x=1789419203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hHTlsghc6bI82mwngIzGXI4ncoEpEEoe7tYa8QxD/gk=;
 b=Q1f548Bl7kcmzKFz3PR79HavQLN2PA/szJt1Dt6dEpzPFzRzFXc3wSgWw1xChCKgTn
 xlC8t9NRfWaRFHIYMIE5iDkPx1APSaTOaTq02A3NNPDzkK+D59MbeFIib6pA9f85NCgF
 NE0+Vcu7aNY8C2fbx8+QnWuof07t+E/Sf71Ryw8yZXC1tWpn7jsq+q28n13zPa7aNIM+
 fCzo4IMrFCg1gPEEEr3k6LKWB8wVDFr+DO8RaWMwx1oXwnuxMgnuBBt8TfO5oP+KC2Zz
 3cfMVKCSjcyuvvErSfyOIbhOJJGoupstt5Dk4l6iX+10dafNVoc8FWgYrri4npCIoyk9
 zw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788814403; x=1789419203;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hHTlsghc6bI82mwngIzGXI4ncoEpEEoe7tYa8QxD/gk=;
 b=WTkkzCk3yOU2f4x2b4Hz5cMLNh/7mtwjV6doNM/VnISXUsoW2TLXcMSnrx23Jt/0zQ
 YkvFjZnT22GGFZQ9E7be6QyZmNQqNhuobLJQVMUygko3eNyc0YkuqfMZIrYmJCoJIoWG
 TKOC3bKDZLrn9z31gBAtVCjReDdNVlRebCWAuu8qgPSx5o5avbSx96JJOWdT9laE3t1+
 0TwUBDPYQiRjeabUkEzsZ35YUn5hA2TLVLBIEtc8Rhx7RZxmiEgqzNsod39QtL53+wZ8
 NNKQ8DxGg4hRIAbACgXK0GiIXjjhpz7wlpJOWkGjmkv2ByHkZYmNtbUn8yH/TFbLduDk
 bcrQ==
X-Gm-Message-State: AFuF++mXPxvX24LhkNuUPlDT9OtQBouG+ro48QKMUuTOZSmxyQh3TU6X
 lRFBoMgBIVYa47vS+dWSLxkibCkMGNcfcgx6GzIOEJj0IO5MUo5KYi4HNk9gVobjz12ICjdwof9
 R6NiO3Q9Td11bbGHBvM4jrT/Ih/5VzSbAWZoW
X-Gm-Gg: AYBFou3tImYf2U1jV3+dxIeaRTJyfUqK2QlFuWdUCR3+YvBikNhPnEHYN8cEyaIxnnN
 0m2uoO5AbCaQ0p0r7INYaYFyS+1uIbuqzNS5sCcfJih/p5Qkk7n5/74xWXzePDx8XkdLu37NFsV
 5IGeP0fYMHLMumWDskjlVQwBN1QEwi7UPKnrUkL2N0TZjialK/sbfzJYGnYWE+VFgZNldehC3L9
 3+owaNosSrbh+blO/TYFuKv9p3IrvGY1gE7+JgAGDiGZTFfRDqLWIWaATKlyRe//8bKq174muoC
 X95cnwz0q3/ONcoWvQQoKYNv4SRcoB9EopSv1WCHvUqk3rHwsCvMh/ZV/fUQJZIM4futDLHKxmJ
 w
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id
 98e67ed59e1d1-39b2624f0ffmr36516550a91.23.1788814403392; Mon, 07 Sep 2026
 13:53:23 -0700 (PDT)
MIME-Version: 1.0
From: Metrical revel <metricalrevel@gmail.com>
Date: Mon, 7 Sep 2026 15:53:11 -0500
X-Gm-Features: AcwNN1Uail7hfBVZLbLSCgcFi4NiQiReqXix00ZhivMRBrSljdVZvy7btpguJWw
Message-ID: <CAAxXSL-D=cJ8ne9Lc=W=746TZgyXVVYqWm=kP=CWj8D+M6JjRA@mail.gmail.com>
Subject: Re: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
To: arun.r.murthy@intel.com
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:36 +0000
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

(Replying by email since patchwork doesn't support direct comments =E2=80=
=94
apologies if this duplicates my GitLab note.)

Noticed v5's i915.CI.BAT is passing now =E2=80=94 good sign the build issue
is resolved.

Before I compile and test v5 on my hardware for a Tested-by, I
wanted to flag something from i915.CI.Full that looks a bit more
specific than the usual noise we saw on v1/v3:

igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-a-edp-1:
    shard-mtlp: PASS -> ABORT +1 other test abort

igt@kms_cursor_crc@cursor-rapid-movement-128x128@pipe-d-edp-1:
    shard-mtlp: PASS -> DMESG-WARN

Unlike the earlier CI flags (which were all in unrelated subsystems
like gem_ccs/kms_plane_lowres), these two are both on eDP-1
specifically, same shard, same test family, both regressing from
PASS. Is this known/expected noise on shard-mtlp, or worth digging
into given it touches the exact connector this patch modifies?

Happy to go ahead and test v5 on my hardware for a Tested-by either way =E2=
=80=94
just didn't want to give a Tested-by without flagging this first.

Thanks,
Mathias
