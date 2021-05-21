Return-Path: <SRS0=c41V=KQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA03C47078
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 14:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECA961132
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 14:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECA961132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9A06E900;
	Fri, 21 May 2021 14:55:19 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF046F890;
 Fri, 21 May 2021 14:55:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u133so11291176wmg.1;
 Fri, 21 May 2021 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYm2q8UlxbFEyevcAFjmNarmhsddkGFIu0T8r1FdCck=;
 b=SymXLzgp4IQCswr8nsXU0X0/7HB/CMRTojNo+8E/X3EzCFEgqKvnvI4j0vxSMpDMoH
 0ykFKfqAWM8KhxpFKLAoDeKUugvn+8Q/i1myjddSpyLEi+81vid4JrQvF9QfT2H3lAMT
 XQaNj9Y2jcOkvNfywqUMuQY1rxsIYpbEGMnkmKbWw98VHMwxWJvUk/wfvhve3AZVAX0r
 chqT7z9GyNWR1lMw59ptfC2KKojDBEnL4f3wYWppSXwrVqwYvl/RckSwLoQbHFoQTvpK
 as5yPdvPZYCBuBojQqK2IzMS09xmglmVXSJYuw5NMuyn5JUcRpeozxRlN1uu5k518Gak
 JKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYm2q8UlxbFEyevcAFjmNarmhsddkGFIu0T8r1FdCck=;
 b=fAHn90v7kLt+C5eZsZt9pPIDNfKkYfMUBSD2kpU+Y/z68t6WsjMbYs0ayiiMxs+Hpq
 aolDrp/Bmp8KJ0DYFBxfaHYJKo7wpPFg/NoBFBYyA4WRte1jDmWfqI+wHschXFoa3Xhs
 oAAg+Dxmmk94bnscuWjkvP2ltFXrg8EkMQGDGQrESWc/ofEgITH2NCD/u1j9o+echYmi
 RacKjDVAZJEvBa6C+U9HQX6tXIt+m4lvAjg9GsZ20/YB8kT9Ap8WUQOSKLIFzq9KiIRt
 twVURLPDX+WzY57RCF4bwYFFfLqcXYr4MIIP3G1d9QW5CLSa3K2YFp6Xyufm4MPPQUxo
 IwpA==
X-Gm-Message-State: AOAM530ZylwPkNMygXupcAqiy10jlgqDuhhHnqhmVRn8298nJgBTMDTQ
 SpGTIS3iwLVs1KpYHqfeAZLqRqbEwL7jk7/zrG8=
X-Google-Smtp-Source: ABdhPJytIJvOZWC7oQH8/K1lNQPn/h96jaDr9y5XKzz81AIZ6s8SfY9QtqLtNWTqGIG3qOGTyk/E/jCqV6kODPPAwfk=
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr9838413wmj.49.1621608914380; 
 Fri, 21 May 2021 07:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 May 2021 07:58:57 -0700
Message-ID: <CAF6AEGvr_CWDGgKFTNGQTiApbg=kyOn=uBrRM_H3DO8UBq-W5g@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with
 implicit fencing rules
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 2:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
>   but because it doesn't use the drm/scheduler it handles fences from
>   the wrong context with a synchronous dma_fence_wait. See
>   submit_fence_sync() leading to msm_gem_sync_object(). Investing into
>   a scheduler might be a good idea.

Yeah, drm/scheduler is (along with a lot of other things) on the TODO
list.  But this isn't quite as bad as it sounds because userspace uses
a u_queue thread to call the submit ioctl rather than blocking the
driver.  (It also offloads some other work from the driver thread,
like submit merging to reduce # of ioctls.  Coincidentally that
arrangement was a step towards preparing userspace for some
hypothetical non-ioctl uapi ;-))

OTOH it would be good to move blocking until the system can free
enough pages to repin bo's out of the ioctl path to better handle some
memory pressure corner cases without having to be interruptable over a
lot more of the submit path..  Running chrome+android on devices
without a lot of memory is fun..

BR,
-R
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
