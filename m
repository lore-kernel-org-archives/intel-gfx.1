Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF60EC88E75
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 14:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6473610E842;
	Tue, 15 Sep 2026 14:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TiGuyvcb";
	dkim-atps=neutral
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com
 [74.125.227.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAFD10E23A
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Sep 2026 06:32:57 +0000 (UTC)
Received: by mail-pj2-f12.google.com with SMTP id
 98e67ed59e1d1-396ccb1a990so2493419a91.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789453976; x=1790058776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QqArEvzGbVkfAltQ7Gy444plDqM6Su1k8Ceju0cJ61Q=;
 b=TiGuyvcbn0yt2akXVpN1Rz2lJdQNffV7W4hPiGvoxmATobo3LKvJySMW3gpivhNqyg
 99P7FbbBwlSC6Z4j/5QVKl4FEgJJrDNmk40cAtjNTxg6ggfQ85PCOTGKdRKNvlRAxki3
 cccumrC3X+yNlD59p3MSaVFN8kZ8oBpJ83KZ4kWa4uGb10NtlfXwZ4Z+KNxMiTKktbg2
 PxC0QWWb75cmDtrzdsTgm2ZQB38Gbz5mehVgoQWOWv2rt1wbRMkYndAAdkszAJOwD2e7
 eg6+9YsX0d1n9q0cooikRyarrocdayHDfgdHzbuRQYK/chnXDuPqXQ/Gma9Y8hoiQ866
 NbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789453976; x=1790058776;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QqArEvzGbVkfAltQ7Gy444plDqM6Su1k8Ceju0cJ61Q=;
 b=PBHL6KBJAcI8ESkOTOCy3H8+oJGnydJwP3kvZa1Ndf87FJLcghB/JW6KQv3iPvO7Zc
 1ZcHefkKe/6InBlTvA+RQP4M9F/jSzHUmGCsEBEp1jNJAIvXId262IK0aRSLCyWE/hXR
 ranKmX25DuxKl8cQ7w4JE5U88cFoMR0XqucO9kmp/TFmiahL1sk2di8mR/gj1fkQV2s/
 Q+jNF8+sxfYEEIHdDkgss3Rh8Ddg2l5U6+EeYipT2ieEnnd10h6ovk3xfVwQeBh2nQuT
 PWem0hiMMBxcedwAqvuoQATSP69WjZKkaAnRKQb+dgbpgdP3LJswVRbawiBlsBdtygUd
 3Cdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqGnV81SvJb7pnGuGpZDbQ4G+4v14NbOXFU4CcrRNx7T8LYjYjxLlPEuekLXLM2cVTJGeNIcda3IU=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nAqyehtcZ1OSSRk9pYNlFp7QYlrehYzT21dDGLWjGbirjS2MN8
 QwTXP2DUz8KR9FPt3Lc6D8jij8u1hcjx+9hlhxsKJAGSQo6UKK/o/b4L
X-Gm-Gg: AYBFou2Mwitnea5bwCyHsER7JYYeR+jg8dumeWEhaQ/gOokYFbedHtSO7DmaHNrbeVc
 Dd6Bkq3qLkVeDtfYq+UfH8OeWITKrFWDSVyjhuCoUmJuf2oYULioi81tsNQ3MzytQkinORuu2wU
 EL0WM/rOT5Cv2FcHXWOLN/VjztCYCj5Ux2hSkhuk8YoqOnTvDKQGDgjzvRRTXf/k7QA/HOFvmqm
 9wQYMemsAjAYaVNa3sIH9HBZClMaiF93UYeypYikIk30lSpeqBlok8Xy6Oa0Na132Aumx96XLa/
 uMYhThLT0FhDiCBHfEN88uI4SlNOvLSqFdOC8HvMvuO6f5BHvU1rfe6G/udqH/05Wfy2Bzap5/l
 MJQO5ViXM0zdxzYapFvKNG4oHHV0HEz8VH5Xb3wpsBTw02lH/IeUWOuq856TikRG5CO96NILbHF
 8VMSDi3lKCoeh4jpVz+M/ZXBqqe2GUR7zdb3LDXRFdjyOrVO4E1tkuq+LETZ6Zldkbm7ctg9yD5
 rMSLTyiYTNa4kjOQs/BiwZt2nJNK03K+s8OoJSiyhPYvUDTlEn3Tmu6aicAfmyGK01An1xiyyQT
 WrXbUE2MOCqo20aZp0ec5+nrvNPWaCar5KuCz923fEiSWOvPQcRgV6J1iTgr088=
X-Received: by 2002:a17:90b:4b10:b0:39d:e54c:a28a with SMTP id
 98e67ed59e1d1-39debf9b35dmr11228325a91.8.1789453976485; 
 Mon, 14 Sep 2026 23:32:56 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39dfd9baad9sm3254695a91.4.2026.09.14.23.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 23:32:56 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: unlock shmem folios after skipped writeback
Date: Tue, 15 Sep 2026 14:32:53 +0800
Message-ID: <20260915063253.2471499-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914111511.648711F000FF@smtp.kernel.org>
References: <20260914105606.3997649-1-matthias.goergens@gmail.com>
 <20260914111511.648711F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Sep 2026 14:13:14 +0000
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

Yes, the budget should use the supplied object size. The current limit
is a separate regression from
776a853a43c9 ("i915: Use writeback_iter()"). The old loop walked
size >> PAGE_SHIFT pages; the iterator now honours the pre-existing
SWAP_CLUSTER_MAX budget, leaving size unused.

The reclaim-accounting consequence needs some qualification, though.
Before optional writeback, i915 drops its references to the whole object's
pages and clears mapping unevictability. The remaining pages can be
reclaimed by the MM. The shrinker also counts the object when writeback
isn't requested, so that count doesn't mean every page reached swap.

I have sent a separate patch [1], "drm/i915: size shmem writeback budget
to the object", using an object-sized nr_to_write budget to restore the
previous writeback scope. It remains best-effort.
I have not measured the effect of the current limit on reclaim latency
or OOM.

[1] https://lore.kernel.org/all/20260915062924.2410550-1-matthias.goergens@gmail.com/
