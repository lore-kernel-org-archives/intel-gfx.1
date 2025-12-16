Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C04D5E36C
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Dec 2025 14:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237A410E2D4;
	Tue, 16 Dec 2025 14:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ltawhKxd";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7689E10E2D4
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Dec 2025 14:12:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC02C6017B;
 Tue, 16 Dec 2025 14:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1320C4CEF1;
 Tue, 16 Dec 2025 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765894365;
 bh=liWhwvDHYDYHN0IDASCGbuzBkIyjUkT93x99yt0fes8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ltawhKxdB7vFAhhnAOSznUOPVUcyY+xh8At6FjuDaGqL3K9PLQkCQR+dhq4EriqOZ
 LBWz/aPBhF76NSn4KMpoiElew6w06w/O7clST5SUrfnAwlwrAeAQLRCevBRVgC3fYA
 UcgR3RpWCC3r0jXAkKUumAMurPLwYimeogro7IXTX1yuF/itHb2ps9Bu9lsx6f4O32
 1ISX59/Qy2Rlxj5czg7OsG27vK7mM7vuzkVyjTCHhI4CHAdLqcDBYZOtMpDtLv9hg7
 AHh9Qzwr1mozhwzc9wsNBYMBBcVCZr+b0FAmo0D8F0dI1TFZ2cpmTsi/7oODDsbn9g
 VhaSSwQMZ96iA==
Date: Tue, 16 Dec 2025 15:12:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5 1/3] drm: Warn and return before division by 0
Message-ID: <dj3xnx5egt33nry2y5kesvhbxt7itm7juuhisigqid2zrjdzrh@x3lhlg7gh2fp>
References: <20251204143827.111428-1-krzysztof.karas@intel.com>
 <20251204143827.111428-2-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204143827.111428-2-krzysztof.karas@intel.com>
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

Hi Krzysztof,

On Thu, Dec 04, 2025 at 02:38:25PM +0000, Krzysztof Karas wrote:
> drm_format_info_block_width/height() may return 0 and cause
> division by 0 down the line. Warn and return early if any of
> these values are 0.
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
