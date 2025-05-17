Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF6C2D0CD
	for <intel-gfx@archiver.kernel.org>; Sat, 17 May 2025 23:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034110E1A3;
	Sat, 17 May 2025 23:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HoAtPvTs";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1C110E1A3
 for <intel-gfx@lists.freedesktop.org>; Sat, 17 May 2025 23:09:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D8CA4346F;
 Sat, 17 May 2025 23:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97914C4CEE3;
 Sat, 17 May 2025 23:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747523385;
 bh=J5DHIewhjtYx/o18oUw1po7z6k7CsstndltagGnSWcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HoAtPvTsh2n0KmDlS0ABumyfPyCMOPs1isi8/22JzhavdKtSIhBQJdD4GEkKROhuL
 jRAI8SlfybhtX3gVY85c8BBzC3GFJWLNSEQMVGYFSpZ0A3HSVCgiu3+Gs+keoVi5Yi
 qFxsy3FWmZoOuysVs4pbB5cACYYHjMAMXKWJlbv39dA7wJDbGbMzRHeOKb+MQGCIln
 IBQYagYUsma+/gRJ1LoPrML4LXzEhSUG5ZpB4og6xfdxg762inaJbXunyQ7wzqa3t5
 y3JrCzjnr5bJFLH+9YIyI408G8Z50VEyyUSjB713ftOgzgfBxQXF2Dmf+x/6PtJQPX
 GKjVXKcAQoGaA==
Date: Sun, 18 May 2025 01:09:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/i915: DG1 fixes
Message-ID: <w7oji4p45susoxb7zyz3mbthnfee5wach2552k5nts7sprl2jz@zwsl4kaopdwc>
References: <20250411144313.11660-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411144313.11660-1-ville.syrjala@linux.intel.com>
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

Hi Ville,

> Ville Syrjälä (2):
>   drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1
>   drm/i915/pci: Remove force_probe requirement for DG1

merged to drm-intel-gt-next.

Thank you,
Andi
