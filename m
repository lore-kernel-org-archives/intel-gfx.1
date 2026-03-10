Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E78FFD2D6F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Mar 2026 12:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252610E6C8;
	Tue, 10 Mar 2026 12:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bhooD2D+";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E30B10E70B
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 12:54:08 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2aeab6ff148so1535ad.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1773147248; x=1773752048;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mm6hm+LHoMGo5Ew01sq1dP9YSITnoqIDxYFDqmtgvh0=;
 b=bhooD2D+L9M7Bb9jOkredVaupFVK95A3sh2S6yWFIZ05Vc638sgtqAYZ9F8/n0bKfO
 5aNu6qlMna3zywhSUahfFye9TuELYIDxKWwCIZZqHK9176KywLp+1sq9NKWS2UDTwjJt
 STqnSGQIPajj7SFTQLJcuGMbQmm0P0ma9Ip0IZZoc6G3/bVZA5KxujVyyk8tpx7uEODr
 YjkYBX/ZoCW8RQmVUgxWf0ArsgvIK/Tvve8GMvWzsFnXQPs0b0tUU0tXNXaQ2uXBqeL6
 +idSRiH0mLn0WJw/NGsDEoYYt2Kz5XZSQ3WXFwKZNOauCA9F299ZAOgvbXtLCY/QYrmF
 w6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773147248; x=1773752048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mm6hm+LHoMGo5Ew01sq1dP9YSITnoqIDxYFDqmtgvh0=;
 b=SDGRhDVn5hnlUHg7CCz16CntOmHqmudyo+Cu6I3Omx7V1XxQ/bX2bLFtcQ0KoGbL27
 KJ8FcpQYw2MChqOxMMIo6BkcmEKezPxVUWQc0nFrCRAa9nPqj0xlh1ZGSDJ28b38h4Bv
 v2jxei9H63foV4rz7GwRAdoT1SjxYpsh92JxeNU89F4U3r9nN2gYb7seMQCZvYKMEg1X
 m8KjVj80YMrUGzwvaQOgHJGHtdgiT7peAEfIWBoLKoqWuoDPw2c4QWhfegzpVsapjCu1
 8VOtY3HYt0fBmN0E7d7ZPJNx01r7vAxDgUCIjYIOeRPXHM4D/+Frm6h5eTUQ2EKNhBmn
 XEew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXpK0Vpcp1MNPH2+A4CWD+NN/JOSMbnOx1siHh3sGkUfnKb3OfSFgKvFMLeW1Q5UuhNV0SIHMx5R0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD+bWYU58iV2KHHbo0US6ZBeMIHY7ICtAqCw1AqTqoejalHCjq
 EOfOTZIEj6tVHHRC4vTovz0UswP81Xj53g4xzQzjcaQ+5ROFfcc37gzDrg3XYnmyDw==
X-Gm-Gg: ATEYQzw6OAHwXSKj62tEPSidZokkFnNCOsSjNAdDzVc7OrKuMd/Qv5QpDrHj589eE5e
 jdCwWAE93c8uzA0YaQZCghS04FkX+1vhQF2wASvWd3dXsOs+6APWGVoih3dwGNBN1+mJuO9O1U3
 InoTUBaA6x/QFH2us7Hyh82Zx7bS7ditCPSyEw6hM2dKnKgU8AWWOqb7bgLORbFV3vf8bbU8j7c
 cIFy0yyiKjNjpUqIt9bkrTn4rZpjS24WYek2aGlwF4D4HuhkHBPQ+/5MESYHnOxIRxjhj1wYMG+
 Pqs6aVrWCdFDeZuFhfH9Uu4nOi5FRDEp5Lp0ervo2kPumMY5koS96f9aGRriHgH6RnVN9afP8L+
 4vAm7IiMawclXbJ8htOZuFyj0YsE0vPAKMAJqGKW6EklgIf/CXoxY32N6toYrvOIyedkgjwrvi0
 UO1lp8M3OJ4Lv9Xrd3TxQ3ZYXlzqqCTW6u6HF7IXkcQb+pn5+G8CQN1mhxDw==
X-Received: by 2002:a17:902:ebd2:b0:2ae:45bb:bc4e with SMTP id
 d9443c01a7336-2aea30ebe48mr3008685ad.24.1773147247400; 
 Tue, 10 Mar 2026 05:54:07 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com.
 [34.124.129.10]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c739e0cb73dsm12445679a12.11.2026.03.10.05.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 05:54:06 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:53:54 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
 Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAUYvx6VEdSmInm@google.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
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

On Tue, Mar 10, 2026 at 12:49:12PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Alex Williamson <alex@shazbot.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 742477546b15d4dbaf9ebcfb2e67627db71521e0..d71922dfde5885967398deddec3e9e04b05adfec 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -923,7 +923,7 @@ vfio_ioctl_device_feature_mig_device_state(struct vfio_device *device,
>  
>  	/* Handle the VFIO_DEVICE_FEATURE_SET */
>  	filp = device->mig_ops->migration_set_state(device, mig.device_state);
> -	if (IS_ERR(filp) || !filp)
> +	if (IS_ERR_OR_NULL(filp))
>  		goto out_copy;
>  
>  	return vfio_ioct_mig_return_fd(filp, arg, &mig);
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

The cleanup alone looks fine, but I'm not sure if the maintainers would
be happy about the tree-wide spam, since each patch might go through a
different tree. I'd wait for Alex's preference/ack on that.

Thanks,
Praan
