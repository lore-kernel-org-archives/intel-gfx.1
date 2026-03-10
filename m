Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AF2FD2D79
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Mar 2026 13:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D2F10E282;
	Tue, 10 Mar 2026 13:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ADQQpd+b";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF4B10E272
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773148926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
 b=ADQQpd+bpcMvyiI6BuK6I/AtlFPVjRaT1jbvm8x0bcg2sn4Mv+l/q+wGsOaa7zGZavpvJL
 HOw6n0NTrJxN8BVrJlzy+3Oyq/AicE10gafpjzfnHFVMImjvlOy3qRSEO7jpexZVWETsUQ
 RoRPrXnJkd5ZbUZ0X+x9wM3CIJYSD9c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-737G5GMMNmqKdEzIUTCqjA-1; Tue, 10 Mar 2026 09:22:05 -0400
X-MC-Unique: 737G5GMMNmqKdEzIUTCqjA-1
X-Mimecast-MFC-AGG-ID: 737G5GMMNmqKdEzIUTCqjA_1773148925
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cd81506677so1375226585a.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 06:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773148925; x=1773753725;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
 b=D+ECmTVaI2UWP56zkByER3mclIzZXHWBIGSFM3KRlVWpUZ13HU0f/LggCLCsj7t50t
 i8N8eNoimxYMRXHzw5VJobvKnFKqi2surHy3BHszT+MpVKrBsQnYDBMY+No9vrmbKx1S
 zmE1oQpoSVtwIOYCj9/GItqgiaxGtYvrB511bm0I+PkgS2kJ8FMdCV8FYyr293slIoDM
 flk8GRl9M5hMEMVutHeP8YINlmga5CTqGcF8j9ckj3nsjWiW3lMz/1xreaVLUsWrPgRg
 KugSNomfWApH9m48rn8aBqLFScz9mEfS8DW3xLcazN8NQyZxaKAz5bAeSNnXqrisgRKU
 N77g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ6T/qNgSFY+FG0JhuHBg/cB2WUWI3g5ruVP92w1PHFen6BRMCe1gog+hc2JQqa929wM8OGGbdmTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygTH5xYfgPXR3QzZSEqOywJuop53PRCR0MjxoSj+a+DcF4x5wI
 KlKQkFcE4zJG4b8WqHVhCfvtT4/3vSHbvtvecZkR+q47CqNBLkZEHvF0f2wtbfC/4KPfdYQMj0t
 n9EjV1+GsA15ipy3yu1y9UISoLbDUIrmr+GOWHXXnIi9+Y6BJvSH9OUYSczs3c11NRP/++g==
X-Gm-Gg: ATEYQzz8D2rBRlutBUM7MYZd9cQRAydKF4YQgaYWrO5/nuqUN8UB/ZFq/8yTY1lxYKE
 If9yMME0EZ8WQNh2ncOaaAr90BTfzlLXl+TnWuQKliVphqgHZ1Sg3M4EHHn9WNYhMJ0IJAccCnV
 ribK/EoEOczuqZDpAqGaKyuidhzA/HWl8uAP+uNI8t9PFML/400MGl/WLFwQt9nBV0ATJqNyicv
 vB5bM9R1fTrxE/RERbDxn39RXX+dvGMdEAvH9zEXXajqel8aQ98jhgTs7dIQJY6u175qivGBky7
 GguBZhjDozpKe4D8x65kzsfpSzxBLVC3ZuDn4ncTgOWwdzBIgZgKSQ5hOheeMPYP0nKluwvquys
 Y1GsY206DtsAvQU/+534Lip+WTAfHW7MRR7Njte5KIB+6z+rHEdUJ0nf4
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id
 af79cd13be357-8cd6d4f9469mr1830785285a.45.1773148924694; 
 Tue, 10 Mar 2026 06:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id
 af79cd13be357-8cd6d4f9469mr1830766185a.45.1773148922638; 
 Tue, 10 Mar 2026 06:22:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cd8576db0esm474754485a.47.2026.03.10.06.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 06:22:01 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:21:58 -0400
From: Brian Masney <bmasney@redhat.com>
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
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAa9vQg4BSxl1BJ@redhat.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
MIME-Version: 1.0
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bNCbEDjnc_W4ChLFV5s_QA7kml8xgcSUZ-ebwZrOLUk_1773148925
X-Mimecast-Originator: redhat.com
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

On Tue, Mar 10, 2026 at 12:49:22PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Semantich change: Previously the code only printed the warning on error,

Semantic ...

> but not when the pointer was NULL. Now the warning is printed in both
> cases!
> 
> Change found with coccinelle.
> 
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

With the minor typo addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

