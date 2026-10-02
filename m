Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F88CA5FE5
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 20:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151DF10FA17;
	Fri,  2 Oct 2026 20:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RFSrmDB4";
	dkim-atps=neutral
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com
 [74.125.227.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6E10F43E
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2026 07:31:56 +0000 (UTC)
Received: by mail-pj2-f40.google.com with SMTP id
 98e67ed59e1d1-3a0eeda3e03so3186223a91.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 02 Oct 2026 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790926316; x=1791531116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4GK2j3yff62yhzPmtMp3tQn7pesGTkfJ3iXNJlBVz40=;
 b=RFSrmDB4e0MgDSZZNYaDFN5hbPMA+SUIqe1LZjHLYSE4oPmoI7jwURi28Dofehs7Mp
 OndslIXaizQnWaaZeSFHBmpmqRxepeJlhQUCUbPcMTwhJOXBXc61wSo7CYS3Sral0z7Q
 98vBHKelH1llDyJunNWkxS2/4j7oYF0QMkZDO/G9WrnJ0Le4kvDua5fuiTghd+ny7GNn
 224npfr80rUrZBy777wep+paNrs3Gvvl+VcqxyrVf988EJyotgUygwmeOpleuZPoMWrO
 tvz63x8FJpLEeQMeJ/PwWDKwmzC4rN/fLQt64/tajS090VOXQQzIKy1MO0Shuj406UOU
 Uhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790926316; x=1791531116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4GK2j3yff62yhzPmtMp3tQn7pesGTkfJ3iXNJlBVz40=;
 b=ONILeROEX4nPwRPSkJjr5zwTKtKiDLfjq6Esq3FrBDH8Ot4pSJDcOmE7vltiWVOPDl
 F+FrxrDJ6H98MVeO4tNTtFfACHsdlRSgvVPU9zp1Vnc1oi0n2WMch36/8mGYYpM5Ss5k
 GXTwJrrxhzwFySwnPwAn+ZjeM0dxHNWAOYfVn9NJphHQeRaVDNh2mXy7renX8hxWwjWj
 7TmCZsiLQWP6gFvT8zDjovuH/GDklFFJoAdGpT5o0C/Y6ZBLknpCgAhqbCUSe+HlSquF
 aFwaornHKyaSUPsLr1jN3yQ4BMKL2JHsC4zTE4gPT+Y6IrHL1QSxdT36GK1DbQ5iAeyM
 AFwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBydf6yTxaGDY46wo9eMVhmJ8e6d1CYgZMSEPpSWZnuRINOgrggdn1YUUPTdLMHqyargMO0XzXnZMmM=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLAFl6ZyYycwGAP/31op1R7mZmPdSudq5Ajd8mXc1Q8uS2UBg9j
 8lhBFTJwoO7DmjR23OzWky/KNJoifgMlkHsqWo/sZcMg29AuWjAbAafq
X-Gm-Gg: AYBFou1hH6RQcztfugaKNSRr8OIpgTMk5wqSnjfWHA8JJauWAS4ru0+zmW8DfTJL43v
 qyBHs//c0dztxZ62Qf3GiLWdKitha0AAASL09UrzHfQHt4qRmTwA0hn2ZfcRwPgIV6Wcx2cq+DH
 Afl7gdFTxoanoHdXTmyn5eiKCGzfvggjjJB+7zIgXZaaUzCnrhdoxqwSNzob6b3JqRYQ5bJNPkI
 B2plill2Dyqds1fmuB3OkRQjfclRFndslfkatHc+1iyWVwxRRwuI5u3i8l1DnY2OREYs/C9EYm4
 pluWKt9yKiTwhA/CNfbw1c5coST3XnqIM+2Fl9FMEZk8XBs5eKNntOOEj2i/noP02MEkSbE4qpv
 tl9a+6fd2yWPhoNUIX2FhH7WUCcOUX8FstQB64lLUA5fEQ1pURZbjuBU64IW2TIaWaJ6b0ceZWa
 3G72uiCw0QnuFFzdZ6Ycj/5PfkhnRA4PPpqoXRXOSri8fnVV041u1dARz5U4EFFxC2He3q3r1xV
 Oe6jgmQb1I5ltsUZu7Zbsw/cOB8uLHHtM+wsjJ7tOw6K9V35YuLbiyOHAWjclCkys5xqZjHjSnH
 ks0fd9ZQh85EpUhed6cfmuUypPDkqG+Wd627F8ExeLyRLPfV0YQIMBNVW8M=
X-Received: by 2002:a17:90a:c02:b0:3a4:f818:763 with SMTP id
 98e67ed59e1d1-3a6ce7f67a6mr459939a91.39.1790926315875; 
 Fri, 02 Oct 2026 00:31:55 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a50f01421asm5406118a91.3.2026.10.02.00.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 00:31:55 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: size shmem writeback budget to the object
Date: Fri,  2 Oct 2026 15:31:52 +0800
Message-ID: <20261002073152.2210354-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ar2EyVGO4JgWgkM1@zenone.zhora.eu>
References: <20260915062924.2410550-1-matthias.goergens@gmail.com>
 <179014701977.1658553.16622035964431254845.budget@gmail.com>
 <ar2EyVGO4JgWgkM1@zenone.zhora.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:45:17 +0000
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

Hi Andi,

> I restarted the tests on your patch. I just want to know: what
> kind of issue have you seen here?

None on hardware: it came from an automated review (the Sashiko report
in the patch's Link: tag), and I had not tested it.  Since you asked, I
measured it, and the patch does not do what I claimed, because the loop
it changes writes nothing at all.

writeback_iter() in WB_SYNC_NONE mode finds folios by the
PAGECACHE_TAG_DIRTY mark, but shmem dirties folios with
noop_dirty_folio(), which never sets that mark.  mm says so in a comment
in __folio_mark_dirty(), next to a VM_WARN_ON_ONCE() for shmem mappings.
So since 776a853a43c9 ("i915: Use writeback_iter()"),
__shmem_writeback() finds no folios, and nr_to_write never comes into
play.  The old loop looked folios up by index and tested PG_dirty, so
it did start writeback.

Measured with an i915 mock selftest in a QEMU guest with swap (no
GPU): dirty, unpinned shmem objects of 1 to 256 MiB, with and without
THP, put through i915_gem_shrink() with I915_SHRINK_WRITEBACK.  With
and without my patch, the iterator returned 0 folios and 0 pages went
to swap in every case.  A test-only folio version of the old index walk
wrote every unmapped page (e.g. 16384 of 16384 for 64 MiB).

The pages are still dirty and evictable after put_pages, so ordinary
reclaim swaps them later; what is lost is the early writeback.  The
CI.Full abort in igt@i915_selftest@perf on shard-mtlp looks unrelated:
the patch only changes a budget that, as above, is never used.

Please drop this patch, and also my earlier "drm/i915: unlock shmem
folios after skipped writeback", which fixes paths in the same loop
that can therefore not be reached:

https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergens@gmail.com/

I have posted a fix for the actual problem, which goes back to an index
walk:

https://lore.kernel.org/all/20261002073107.2209644-1-matthias.goergens@gmail.com/

Thanks,
Matthias
