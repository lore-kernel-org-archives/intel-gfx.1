Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF64606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tsgwa26m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9455810E7DA;
	Wed, 18 Nov 2026 13:13:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D486F10FC14
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 13:13:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 91D5440F3F;
 Wed, 18 Nov 2026 13:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568461F000C4;
 Wed, 18 Nov 2026 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795007616;
 bh=7EE5GoC93x9hCb3JkEKCHJoz9aB3GqssFXrerk4AYO0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Tsgwa26mX2HpDShA+oXh1XNDBClc+IUBVPhACKHixmmn4ge9Y8M9Q1uOJtfeneU2W
 diNa/2sDzaQh6Jdhk659AA+TJx0U2NFPI9R8BbMcQ8+zILe0qZ10q7Zu185O42eu2i
 1hBeCPF7Y76kig59IVS2czKOaEZVJRAZq7gf8wTRjf/yR3p8Pd8VtVOG5OPXxwLnfN
 LqATHOcO9Lruc8En0ohxruhVtPU2jFVsQa72edoDZBfA/W1y58pVajhfVYUD10xfc4
 B1SvEq6Wl4gf61+cbiac8KOCIAvnC/m9BSKYE4gfg7apCxm3Dg5xlvK2qJkdGrPIbk
 x5ghNBVLd/ZBg==
Message-ID: <sashiko-outbox-220987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 13:13:35 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/selftests: missing Fixes trailer for
  __igt_reset_stolen() race fix
--

commit 2d0178da9e274898248734afa1c912d704b93b76
Author: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

> drm/i915/selftests: take error_mutex in stolen reset test
>
> The stolen reset test reads and writes stolen pages through the ggtt
> error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
> poisoning of stolen pages, which runs from the object free worker, and
> the GPU error capture use the same slot, and both take that mutex.
>
> So the free worker can change the slot while the test is using it, and
> part of its poison ends up in the page under test. The page then looks
> partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
> test wrongly reports that the GPU reset modified stolen memory.
>
> Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
> loop. Don't hold it across the reset, as the GuC CT worker can take it
> from the error capture path while the reset flushes that worker. Use
> raw_insert_page when available, as i915_vma_coredump_create() does.
>
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

[Severity: Low]
__igt_reset_stolen() has accessed the ggtt->error_capture slot without
holding ggtt->error_mutex since it was added.  Should this include a
Fixes: tag?

  Fixes: 3da3c5c1c982 ("drm/i915: Exclude low pages (128KiB) of stolen from=
 use")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/c47b0ea2093da73a92e=
9e6d62b062f9cc52851d1.1795006734.git.sebastian.brzezinka@intel.com?part=3D3
