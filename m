Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B83CA5FA5
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBE110E43C;
	Tue, 29 Sep 2026 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Li39jcZ6";
	dkim-atps=neutral
Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com
 [74.125.227.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D0610EAE2
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 15:24:49 +0000 (UTC)
Received: by mail-pj2-f31.google.com with SMTP id
 d9443c01a7336-2dd53691be5so21540485ad.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790609088; x=1791213888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=;
 b=Li39jcZ6Bi5R4V1Kz+mraBj0lHmep21RiiXYhEJQrTGJoDQFtMhMrPREp0Ab5CP/X2
 iI5RQH3HYiG0sAdql6gIwbADCpd6+z1WUDPaSdBl1Y/IvA7W5DrPSEekXaajmlo/2QKF
 Ycy8CmfxPY0W4utCqu3DYsSiOhbYEGyVok9r92YHmAP9IoFz91QudNYcfq3C2+CyQn3K
 lbqNtMkchBPoRR3HgC0QoKmx8zM0NBmMaiP89gmJ9TM4dQ3kv+jaeTRTC2XA+wYbqzYN
 IzLIYgVKNLvZ60Z2QMjzqbzw3stsIW6hnLela2XRacUk6/EbvtLyLEwzdB5Br/57wCz6
 w6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790609088; x=1791213888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=;
 b=KyPJgGKb1T7WJ4MQQA8KHH+obTNb8i0AqxGm811vH7MFhzvM9eEGVTNbDiU40E1i0+
 aLkdziMm1keE12O8Qo2G6F3PMmAmrawIOQv5svBSsAqB5q5xDYd5bx9lsXgpJeYgOdbP
 BwKe5WkHOanJXzsMnIFeIH/lVK3Q7VeOxg6wf45q4XM/RHFBkb06AI6DejLD9FaZTxyQ
 jDwnTZGwrUDatuXlj80vA+qhvtbGAu2nwhf+Dkzl5cgY/gvn/ols7D5msSysjs4m1ySf
 WSC/RaWCoItoxWK1uKgnEAcRaS5zdp2a5q9rV+Gx1J45fCS/Xtom9IJszWn54HaO5ew1
 A2Lg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeC2778XWm0h3rKnXe7iG85TlLTUPewcvveUbnUA0uLs5bhhdOmRjB/RlbtylnRZ1YgpuNkoQ16sI=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKTZKvXqtGlvMqgLWeb5wHlblAMvukIIveS5WIQSLUzfAwX9yaV
 ZByCx3uL//3QawtMj5HZileouZlC7PyAwhOPqiU798mL4F9HhqY1yUqS
X-Gm-Gg: AYBFou0Zcd/pZSe26GUJEAMjiwhGy+CQz/etrv2FQoBYTjoMBTPlBmoFsOM7D/Smmo+
 qVq8z/PXuvD6eQgr3XUcnoZc37m1gZc1Mx/EWvneRZKHejkAtw3jXzKvOIhgi+Y4VQw2Q4+x7AH
 C89VrxFmEUDYEBGcnIa0lpU/kq3gDe64+XQhZIgRhdvmC1M6mQM/2gGG2MfRWKncvwgUGdOPiPY
 cvhcv/gtCnRgCdZBjhRaIGroFqG3pCo6elQi5tRQZbX1zUe2pj0+/n5uwRMfatoSNQ8Ovt4ScpE
 396AQBKQ8eUbu+CXZ7rOcmh64LR//bQ/PohWANLdRL81/S7+ztB8zC2vCAjPe61s66VzqpT/KM/
 SSysd7pE4uFEqC0AZCrs6TnhjxQ6qMOU2cwfhaEtpfGQ3Z2uOTe1oBM9aFMUdhOlu0h0lQO9/Tk
 fTd9gXIyPYNI+J5cQHwp3Kx53Xqgeu0Ly4ww0m6hXDphyvSfLtnn48CfjMzerLltDOZmBBO3OPw
 UoQ+zl/R9L3m06Y5So7VJ6kKhFak1nIMbg2cKB7hq6Zwmxd7S+oi2RpHuioPMgsXxISFcdbmItj
 G+zFQT233ezojbEO8cF9TPSYIypenvIsWCw5lkn8f+dUjcLcWY3BpLt+9GI=
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id
 d9443c01a7336-2df94c1bc19mr71037265ad.51.1790609088305; 
 Mon, 28 Sep 2026 08:24:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dfafe765cdsm25166465ad.33.2026.09.28.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 08:24:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Yosry Ahmed <yosry@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
 linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
 util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rafael J Wysocki <rafael@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Date: Mon, 28 Sep 2026 23:24:38 +0800
Message-ID: <20260928152438.2694783-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Sep 2026 12:54:31 +0000
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

Hi Andy,

Thanks for reading it, and for the direct feedback.

> if the system is under overall memory pressure, why do you care what
> triggered the particular swap operation that is being processed?

You're right, and that question gets at what I actually want better
than the series does.  The goal is: when there is no memory pressure,
swap-out may do more work, including allocating memory (compression,
copy-on-write, filesystem-backed swap), because moving cold pages out
to make room for page cache is what swap is for most of the time.
Under real pressure, swap-out must not depend on that.

The RFC was the smallest change I could think of in that direction.
It used "who started the reclaim" as a stand-in for "is there
pressure", and that is wrong both ways: memory.reclaim during global
pressure may allocate, while kswapd with plenty of free memory may
not.  Building on Kairui's suggestion in this thread (swap tiers), or
on virtual swap, may well be the better route, and I'm looking at both
for v3.

> Why can't the kernel figure this out itself?

It can: the backend knows whether its writes may allocate (zram knows
it compresses, a filesystem knows at swapon whether the swapfile is
copy-on-write or compressed), so it should declare that, rather than
the administrator setting a flag.

On the practical questions: v2 does nothing to balance fullness
between areas or to empty conventional swap, and does not change OOM
selection.  Those are fair gaps and I'll address them, or say
explicitly what is out of scope, in v3.

On the recursion question: within the reclaiming task it can't
happen.  memory.reclaim and per-node reclaim both run with PF_MEMALLOC
set (memalloc_noreclaim_save() in try_to_free_mem_cgroup_pages() and
__node_reclaim()), so an allocation the backend makes in that task
never enters direct reclaim; it either fails or, unless it passes
__GFP_NOMEMALLOC, dips into the reserves.  Two things do need care.  A
backend allocating there can drain the emergency reserves unless it
passes __GFP_NOMEMALLOC or fails fast.  And work the backend hands to
another thread, such as a filesystem or zvol worker, runs without
PF_MEMALLOC and can enter reclaim itself; that is only safe if that
reclaim never waits for the write the worker is meant to complete.

> The remainder of the writeup is IMO somewhat incoherent.

Agreed.  I cut the v1 cover letter down too far and lost the
definitions it depended on.  v3's will start from the goal above and
define its terms.

> Adding "eligible" to a bunch of calls does nothing to explain what's
> going on.

It exists because v2 made "how much swap is free" depend on who asks.
Reclaim itself checks free swap before scanning anonymous pages
(can_reclaim_anon_pages(), MGLRU's get_swappiness()) and before
allocating a slot (folio_alloc_swap()), and callers such as the GPU
shrinkers check it before pushing objects towards swap.  With an
offload-only area, each of those would otherwise count space that the
calling reclaim may not use.  In v3 I'd keep get_nr_swap_pages()
meaning "usable by ordinary reclaim", so those checks stay as they are
and only the offload path asks for a different count.

Thanks,
Matthias
