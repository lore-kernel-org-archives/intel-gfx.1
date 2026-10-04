Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45391CA5FFC
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 23:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938F710E2E4;
	Mon,  5 Oct 2026 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rth59bp1";
	dkim-atps=neutral
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com
 [74.125.227.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A0D10E18B
 for <intel-gfx@lists.freedesktop.org>; Sun,  4 Oct 2026 18:14:09 +0000 (UTC)
Received: by mail-pj2-f13.google.com with SMTP id
 98e67ed59e1d1-396ccc02279so588655a91.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 04 Oct 2026 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791137648; x=1791742448; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=;
 b=Rth59bp1xx0Gidl7QDZqRxLy/u7s05Lxnr8eWdc8B3ncP94wGPDcfvWmUNOgpAd6i0
 d4C1JCeJRBP+NriRD+Mw6YIoMTqCz5/wY0Hq7n7abQY0eA17GGR8zJ21f2rfMxuLrRnf
 xdDBW7Qjmjh3EkiN+N7HA38gajhjOXHos7WwaC/aSD4Szff3gqxWDnhQmOP6A/rIl5P+
 bmcfLZAmxZH6q0jBFBd0qAgpB+fdqqeMcfDMQ0tC8naYMB73/vOO343QqQKSVUJ0X6dX
 FFgluQJzxrzK5IAOeEJ3WaDcxITYFSKQgVmB0pgpU92RCK4TP6c7GZYLDQ9AMYXn9Puk
 KKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791137648; x=1791742448;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=;
 b=xaQsbiGvJdRjbcGxF7TDOJOmYTKAOjJKAxTupbJ0pnjcpCcq3dN42yzue0EpiiMLMl
 eUFpRu90stySMw8kaz95iv0F4He2Ig+GKNA+qIPpqQKiwjXs0u+g5VRJK+jpBiVnljqA
 vpTFpEfGrmhHQ4shFxWoxQx/TW/Rjf69izU+umQ3d7iXDlyVDXBsTAQp/5BKxMEKIkVK
 uxMhI+JvEZiEdngRPPBeilxIsc5m7JqBAdFwvqkTjLM++TPjox1ac9CbF2iU+39C3zIh
 iBe6Z0gwtNPni9r8FDZHHyZS2ZO5NzZGLfAqYLT4ITy/mvwk/CzPHQtGHhvEq6UctRU4
 iLZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0D8UN0qZYWRID0coYsOmMVv6bzjqVU4qc/jiIjnzYXuQn2CGf3miG4XMw3GQ5OTCz4EnuZ5epxb8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJv2UFmSGtAWiymC0ihBgC32iswr8pDatpaisOClcdnj9g94MAi
 1s/o4A6X364Q/kHA5bBinJIGOxnhGSESTI1Gzf4vsggA920gFQayQlAn
X-Gm-Gg: AYBFou241q5odeeWm2UUxeNJugKBNmtqPT1496jGZIQO4tNXT5pynEFNd/ZvZm0rGo0
 DAb1R+jWJdSuNh6jk55pWuyYliIlmUaMhGYC9T0u0QwpcJW6gWUBOmmh4KpjoSqkLrAHtW5AcAD
 Vut7cW5LX1FYGAuhkDpuEVfrIvBGvfwF3N2965Braje9+uKj4bqE7Rz0DOvLODDDf59rV9mNnZG
 hBHGR/EsTG8S6MhySEii5mk33hAUaVYmedtZM2i5Q2EykDZYfuuQtBE/JyC64E1uusG2nYG1U3j
 nQ97BQLivaLiMjB73hl0otmEmcXSo9VPBU+KakOe3zfAoZslG2cCc05W7otG/ilJCaByXheB+M0
 PF2mTD+C8WTBsU/QNJYIh9yxViFVlC4puhzyaKPIwfPuPuJwsDWUF3IEvURG7mOhEyFmzm8hMMt
 wAerxn2cS0FYwInuGni2D3k2kqzL5Ge+dN8BtLHM2tIybZoKo5yKuPcZ54VZZewzLcOR7It3gq1
 echPPoKgwwB8LP00REoN+hyJXluQgUHOg1g6qc9NQ==
X-Received: by 2002:a17:90b:4ac3:b0:3a0:a781:2c39 with SMTP id
 98e67ed59e1d1-3a6ce3a978dmr7662178a91.7.1791137648512; 
 Sun, 04 Oct 2026 11:14:08 -0700 (PDT)
Received: from gmail.com ([220.85.166.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a78d59f1cdsm7460304a91.0.2026.10.04.11.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 11:14:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 03:13:58 +0900
From: Youngjun Park <her0gyugyu@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
 linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
 util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Message-ID: <asKXZv5SxBtxQxqf@gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
 <20260928151944.2686626-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928151944.2686626-1-matthias.goergens@gmail.com>
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:53:28 +0000
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

On 2026-09-28 23:19, Matthias Goergens wrote:

Hi Matthias !

> > Just like we already have a "swappiness=" parameter in the reclaim
> > interface, perhaps adding a "swap.tier=" would be better and much
> > cleaner to achieve the same goal? Based on Youngjun's work here:
> > https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/
>
> Thanks, I think that's the right base.  I tried it: on top of
> Youngjun's v11, a "swap.tier=" argument to memory.reclaim is about 40
> lines.  In a VM with zram at a higher priority than a disk swap
> device, and a cgroup whose tier mask allowed only the disk, ordinary
> reclaim in that cgroup stayed on the disk, while memory.reclaim with
> "swap.tier=" pointing at zram went to zram only.

There is an earlier attempt that may be worth a look.
https://lore.kernel.org/all/20260618044857.69439-1-jiahao.kernel@gmail.com/

If you go this way, the discussion in that thread worth refering too.

> What it doesn't cover yet is reclaim outside any configured cgroup:
> under global pressure, a cgroup nobody configured still reached the

Right, so for now every cgroup has to be set to exclude zram, unless
another idea or more code covers it.

> zram tier.  So for v3 I'd like to add a system-wide limit on which
> tiers pressure reclaim may use, on top of the per-cgroup settings.
> I'll wait for Youngjun's v12 and build on that.

I have looked through the whole series, and I will keep this use case
in mind while working on v12. :)

Also, to share what I had in mind, I was planning a sysfs interface
for each swap tier, /sys/kernel/mm/swap/tiers/<tier name> (exact
naming TBD). Maybe the system-wide limit could be handled there as one
of its use cases?

Let's discuss it in more detail after v12.

Thanks,
Youngjun
