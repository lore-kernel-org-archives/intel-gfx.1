Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40422C5DF87
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 12:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8755210E65A;
	Fri, 21 Aug 2026 12:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a4GsrilI";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4AB10E24E
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 02:26:53 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-92e65e18969so33920685a.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 19:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787279212; x=1787884012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3p22lcB0JjWSZ69s6Uy8khUw1NryKg+QOA+ussz8obI=;
 b=a4GsrilIt/4P1XguxEM+YqrECrIakm+iIs9ncp0I/07HCPtsMxflV6m3ebam6y7NAH
 Cpm+SsECW9geLZPHO2S3ncQTqlahWcQPIorzt9AFlVLXOsSLZ7DwjXr/UKhGr1IXEZJT
 K4SSYmAaYAkQRlJ3IHsjD2CjPuiyjpD8Ks6E5DOcFCNGvPB4VUZ2hTKfMXVNPyzv2Id2
 5ioT6cdRz1cmkvQaQaPTjsSm3ZKpcMwtRO+mIziaFqi/MfPaz034toEDMow8yRlm5qw/
 w2EP8jL9x5BCoZb1Oa03cjeIAIdZj/CSSOqA/SR0uHNiLw0sHdP3KDsOh0dpRXRXATES
 O2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787279212; x=1787884012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3p22lcB0JjWSZ69s6Uy8khUw1NryKg+QOA+ussz8obI=;
 b=Wve+HTQxe8eT1L4XKUGHW8FEEA+YQBvN66k6U4nvll1b0godTZkA/2mJVdYBnNIeSJ
 mvlfop/C0DBXaB2WFUXbmofOYy6YHJLnTbSIgTOM2vkuAm/NKd9KOgnS9xCwGAxLiMym
 U6/O+C0nUsy+CUaU7LsoAqiN+M3AytFshI8RBeAp8IazBgNkjAD5NesOgAdYs/toIg7r
 5kQYp1z7QSSklm3xXmdWaeQReYnb4BZKfL7uHCJbjO1k5VN7tu1NEVKsPohViTvSNHwq
 jFPAFUnBHkrdOIv9q4Q3iBlG6cyCiMB7gS2mnsiRncuSqYDK1jDX+JSmbxgIaIUXTFRN
 P9BQ==
X-Gm-Message-State: AOJu0YwALuWiYuxoot4jOssq1mSWEgtFm8gl54c1TXCCePmJCjODToQP
 jt4OeaQI8DXLOC/3b4sHCTk3QN8+ckP+Z34yM8vSlBKqTbzJBg+TTxOq
X-Gm-Gg: AR+sD12UOegMVBjglUVCE7Fpb+L7sELQd8JiVOila58oK2561J2LVPy697PUPjd15fb
 MEId8mFiBE8Tto+XZGstLWLx6AUYEokn7wVZXSoW+gAz+T65JjjZt4PCgUEG7+o3lvZH3HRgvtZ
 9TLfNBzZu1iSQ7/yz78ovPP1/Bj8LeGL8HtZ2IqmQga4Vrm+rlm740C7gpumcYXEQllZwKDWQIg
 58X3ghZzbVCsEnn4uBZxHRNWwDQrn8h5g3BBYw6eTtaj7YTqH41RV7DwOpUrLh7LW9TLHUb+PfD
 xXRpEEif8barTnl/qU1GLBXkJMb3VtrQGOlpqb4d80eLquA9gBVASAsuZYrBlcCZ7aKYwi92RQl
 jsyFkr+v5DtMOQVasHp5N1en9LeQU0P8LpZhaV26vit7UqrTOD4lhILIfl+YDAQyytJwk0my05T
 wr723LdEvBeXTEpUBKGd8R6Y90ywSmR4qWKeVNhJulHMIc6XjVpe/hn6JLWjwaurQIbTsPZPOp0
 TkJ+SQQNrlScirw7A==
X-Received: by 2002:a05:620a:800b:b0:936:a8cd:a28a with SMTP id
 af79cd13be357-937285a4fd6mr1143653585a.22.1787279212194; 
 Thu, 20 Aug 2026 19:26:52 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-937204aa8a6sm498714685a.11.2026.08.20.19.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 19:26:51 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: dev@lankhorst.se
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bigeasy@linutronix.de
Subject: Re: [PATCH v4 7/7] drm/i915/gt: Use signalers_lock to prevent
 starvation of irq_work.
Date: Thu, 20 Aug 2026 22:25:29 -0400
Message-ID: <20260821022530.2503120-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706114823.752313-8-dev@lankhorst.se>
References: <20260706114823.752313-1-dev@lankhorst.se>
 <20260706114823.752313-8-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Aug 2026 12:53:04 +0000
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

Hi Maarten,

While reviewing this series, I noticed an additional request lifetime
issue in signal_irq_work().

The existing RCU loop removes rq from ce->signals and may then call
i915_request_put(rq). If that is the final reference, the request can be
released and its SLAB_TYPESAFE_BY_RCU slot reused before
list_for_each_entry_rcu() advances and reads rq->signal_link.next. The
RCU read-side critical section does not provide a stable reference to the
same request object in this cache.

The v4 conversion to signalers_lock/ce->signal_lock and the
list_first_entry_or_null() loop removes this post-put dereference, so it
also covers this UAF path.

This is independent of the PREEMPT_RT irq_work starvation trigger. I can
reach the sequence in a diagnostic run, although KASAN does not reliably
report it because i915_request uses a SLAB_TYPESAFE_BY_RCU cache.

Since this also removes a request lifetime UAF from the common signaling
path, it may be worth considering the relevant fix for stable kernels once
the series is accepted.

Best,
Shuangpeng
