Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817B2C98321
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1928110FBF6;
	Fri, 25 Sep 2026 19:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qtnB3zfg";
	dkim-atps=neutral
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com
 [74.125.229.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F262E892D3
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2026 19:21:56 +0000 (UTC)
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33e79c06622so112011eec.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2026 12:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790364116; cv=none;
 d=google.com; s=arc-20260327;
 b=oPoVcN+KtFIZ3VaTgChbonMSauXoUdaNxZf4R2jhjFeKzVpNoUAWj4V78dPS/OPM2s
 NXhc88NFu4noyboVBXysWAjTHh+ZNjMe+yeJa6qndB9CDE8HyLWPBw+NTWKMdpgIqFnM
 BypxywVMzxh70U53AE84g80tLx/XiENH3ccGa/lt6MxcKb9lE+HErb/IE8p5mJqdMCKj
 3gXl/KfJLxKr6/aCaKJApcav3YXKcxYFIdqG+n9CC3nYnhA9cmPqzaoJYvgDq/7d9Fzv
 uNwCTC3g5jk0zbmCO7tTa+rdsxNqHCeTT/V/V3FZCEaofrdosn1LgdRuikra15G1cBXu
 n6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
 fh=4+QU2dwgY3Kum8YMv0MOp3cDO2j3GRn53DVSK8rlon8=;
 b=bKtVx/CrJ2w92znTjtlELR4ZFFXZz0HxZkqqp2PVP1CnpnWmO+HWI7JFoSgUbEV+c/
 c2RJJmnKDi8FSDY/9+c/a7nVmIInbZd3Nl0hnymX9rEGFG8v2RZt+OcFMJvqLgbVmMFz
 e4emXzeNvmW4jJQrXfCpd+I4kcm6mTegOlIJL9S4Nex33lZopTY+occ30g6f2U47UZIK
 doyyuo7VKyrvD2oSEi/cWOcc5eLfCc+uEauN+v9gFIWdHY1NGVNXGcQddTn46SKdw/Ou
 CILxFZuFLeq64eikRzUUUrVvmWscBbzGuCFQqcwwcfyr1KnssxPr9jPFKgr6PN1s0JIX
 UW/Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790364116; x=1790968916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
 b=qtnB3zfgRMI0gVjZ/icHZXTSS6SGZLYo7z+E0osfq34KLsgFKVrG6NscAHpnTxtOv+
 CZcBHm6teTUq0i4YVm0lNZysTsTEd9nQ8tg1LgDQUMKfNnyJFwbE2e6xIIBRJhYmFfg/
 EmN4fFMXmXyc0pK7I0tGfxd9aIeB2e2lcIDI2AG7wvBKzzS51jL+zD2cS/fu3ksvLWG2
 UxO8EIESiekHPhfKGepSfA5YeUceBOebQgVC0E0xZnPEnfvjAqtTqf+Coi1Jzmv8DNx3
 hys2O6CcInCSDMb0YWGLtjOOt9xjqw4foyv+DPxY0415/B/plGTkScZBjWo5+Kp8NVT7
 WtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790364116; x=1790968916;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
 b=sNu4q+V8xjo1IXF7Bnnw7r6EGF0KfmSTK0se+pXEJHlX34jZcy42GvGDBLeYeacd3K
 eNDp09Da4gQsr5WtN+Y2dVA33COGDtu847wG/PXtNeZUJjVIoTx+CYW5JHlMsl3d34yz
 Zt83ZwMq6navdqop4pEMrxprhD0i1f9wcGTloBNL8VNNX6HpXaYMQ83gvZ1XtFqr2ZcX
 Rhoj9oyUIXRFc0maQ+L/jvG7R4bSoZFXdIChszbHvr13SXpBirObN7oEDbdlHJ3VILg0
 417VK5JUiYBTFBUro/Fvt8/nvLHKsaqWJNi4ZSunT4jlTdjEWZWiGB/s33jIMKXIYtT6
 nN/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBx79nBzl3MEeKK8OFsIjN7pFhkrVLluIhDPzvD2GZlPAspdtflcTxhRTwGMXw5sKRV4th6gXeAmr7s=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kFgtRmge4v4r6wIcv89SqyO0ofkTSl9FTVHfqUGJUu1C7t+8Vd
 fFK0qF3zK8fWJ9/D667GteM5ifmGCxK6FM8LJS/Y253vpZFC20NjV1QaF1ZBp9Ahyo/a1Vj52Mm
 1IkCaPZSX6kxGgEWathXz0T6yWrMKzVQ=
X-Gm-Gg: AYBFou0unfN58jg3EhVMN10Rr16Ea1eeHvc4HwWoqz8VTUzcg+MrKNf41QeO4B7/q4b
 fHY8TVUOGMcf/DbAGgC6PIwbV5z8HOLlvJZiu3h5hGcBqDFrh849gds8D5UP0Ne1M1qpGZrFJFE
 hQWQqImL0bi3UjOyMTqYBsufGP2Iu0pOMVRO4t3ZnV9E8G1G6wvq96XAmcwwWlrLutEoSvzwube
 Lfzk6YNToQA6Jr9n5iFmOzIn4kwQmSW794kfMxcbGJPJIB3zQTsQBl/yBOdcM2Btl8PkkiSblb2
 mb10e+6xfXFddKDEXWrsCBtwhptlVi04Y99fL8x9gODjNKS5HpSjYWp755oJTkop2PCu7MT2s59
 WtL7oW281WLm0ktMZXcRlGMlPa41W1PwoOje9mqL2Hw==
X-Received: by 2002:a05:701b:451c:10b0:143:8212:a43 with SMTP id
 a92af1059eb24-146cf7ee027mr1494267c88.1.1790364115701; Fri, 25 Sep 2026
 12:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
 <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
 <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
 <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
In-Reply-To: <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 15:21:43 -0400
X-Gm-Features: AclHuK8jFToXH3081DCxGG9Esr9QUklLHKbLHdj7sbwsGE6fMm6o6HW2DqiJZHQ
Message-ID: <CADnq5_M0uB6uRvQh3jEZGVEFqmU0wp_w=wmsipXqz=Nq5QZwhg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 25, 2026 at 1:03=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 24, 2026 at 01:01:15PM -0400, Alex Deucher wrote:
> > On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > I'm still seeing at least:
>
> > Does this patch fix it?
> > https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1
>
> It seems everything built fine today, I'll try dropping the workaround
> commits for Monday.  The drm and drm-misc trees are still failing due to
> the original issue.  Thanks for getting things sorted.

Thanks.  I've sent Dave and Simona a PR with the fixes so as soon as
that gets merged into drm-next, this should be resolved.

Alex
