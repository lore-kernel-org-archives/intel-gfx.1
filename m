Return-Path: <SRS0=eTAM=DV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0092C433DF
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 19:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459A122246
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2020 19:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTawzr7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459A122246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892B56EB40;
	Wed, 14 Oct 2020 19:29:01 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702B6EB40
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 19:29:00 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h20so622623lji.9
 for <intel-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=57NdamUPepK7XrLUB0t1rWCZ+s1OpvEZeQEb0MQTGGU=;
 b=mTawzr7KKz8RbPWokneHtSk5gesUVsppUe7cosu7qp3qd4lhm6xuquzUkGlr5UmZ49
 85Vt4pIP21N4tXLRWslgRnoxdtpO9iVT4uXFvRS7I83UR9FhE58fleHfs32yebGhOexo
 uC+3ipH0Ntaqyqyl2qzWUONhlcPk1w96PDnB5RAgvblmKhf6l/HliXGhNrxzeoV2UJk0
 Yp7xGWQUxMptodGT50j0JyJeuKUpvkzwZ1pv1W7s6C9+budAZ2yBcpZdfQy/k6xZUgFK
 JkylqpYBj3Yeqy9/eEYcg9vFjmoCPC0YvC1kK3VayEqrrEZTY6vdzqQOzkovYVnq/FlM
 KV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=57NdamUPepK7XrLUB0t1rWCZ+s1OpvEZeQEb0MQTGGU=;
 b=WrOCHe28ywIz7TgvH1827MG67VAiLi7AGb4VTjw5jGGT5wXdFLMFIPPTmBNA0lzF1U
 jF+vagA0CzXEuGv3kxDxZS6uSjNTFjp2K7NA00PY6PyOri0fXjuGUQ3qOM2M+WOEbGf3
 DNcOHcJD7FMB6PrYoSKayP/W8zZoMuZxhObOq3fNeyIm6ChED6gP8CMr6Htm5UXlU3bd
 Dlx0Ik0flnsyqk5DPyy2/VY+b6eSqw8526xny76uej5UV09HNGGFc9kgZbilyuPz9ygc
 LapHJlJIKp4X3EELHtZIO96L5GNomYcMZCCen9wcqb1kbj3WpjNHXZ4nMq2i8kgWc20C
 cDJQ==
X-Gm-Message-State: AOAM531XK9gJK00jByEgVboHRkUyGss0wJmhR9i7RKjSTe4CWwcNxPKo
 J07OsPOu/x6ie1D2NEQiIswcO42hKSo6YDX9x2nSGMk4V+U=
X-Google-Smtp-Source: ABdhPJyrbDWmZ3YcRPLZrVdntHLlMrtVDXONclYOum3m3DQm8wpP0M5mGc8gL+sLnhNvu5oziLgFxUgMVVL0aOJByvo=
X-Received: by 2002:a2e:924b:: with SMTP id v11mr88844ljg.262.1602703738093;
 Wed, 14 Oct 2020 12:28:58 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Oct 2020 15:28:46 -0400
Message-ID: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
To: intel-gfx@lists.freedesktop.org, 
 xen-devel <xen-devel@lists.xenproject.org>
Subject: [Intel-gfx] i915 dma faults on Xen
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/2576

I'm seeing DMA faults for the i915 graphics hardware on a Dell
Latitude 5500. These were captured when I plugged into a Dell
Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.4
staging and Linux 5.4.70 (and some earlier versions).

Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =
ffff82c00021d000
Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
PTE Read access is not set
Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =
ffff82c00021d000
Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
PTE Read access is not set

They repeat. In the log attached to
https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start at
"Oct 14 18:41:49.056589" and continue until I unplug the dock around
"Oct 14 18:41:54.801802".

I've also seen similar messages when attaching the laptop's HDMI port
to a 4k monitor. The eDP display by itself seems okay.

I tried Fedora 31 & 32 live images with intel_iommu=on, so no Xen, and
didn't see any errors

This is a kernel & xen log with drm.debug=0x1e. It also includes some
application (glass) logging when it changes resolutions which seems to
set off the DMA faults. 5500-igfx-messages-kern-xen-glass

Running xen with iommu=no-igfx disables the iommu for the i915
graphics and no faults are reported. However, that breaks some other
devices (Dell Latitude 7200 and 5580) giving a black screen with:

Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Failed
to idle engines, declaring wedged!
Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Failed
to initialize GPU, declaring it wedged!

Any suggestions welcome.

Thanks,
Jason
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
