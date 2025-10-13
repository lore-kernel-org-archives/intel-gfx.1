Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE29CCD183
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Oct 2025 23:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF1B10E503;
	Mon, 13 Oct 2025 23:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XYD+GFdS";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711BA10E503;
 Mon, 13 Oct 2025 23:02:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9267408D6;
 Mon, 13 Oct 2025 23:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AF2C4CEE7;
 Mon, 13 Oct 2025 23:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760396526;
 bh=3SVopHZLbvjlDS6tKyOEFohhGQ3Kh6X2eaCHB6N9VAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XYD+GFdS5kwtP2HG6QkNUM18K10qh51VbaXlTILT8crMw3WbV9cWc15mvm/g86VBW
 mkGD2ZkmHsTSBFUGLEvNBuw2ByPXzh+RwcdlCyZulMOpxe1izge+jzvS/p3WrSAFHP
 621DePmoN81lOxXTZ2qcvh2TgfA7b47peFu/3i9gpYxfEkdhpkR30aAgECzKy1a2ZJ
 qSmE6l3khBmCzVutuhFsQW4MRktWGn5miSwBIqaGfN4miHGk8rHeoGJJCeK821+acU
 WAEjnx3nfjC2XIOzPcNe93nxdebld9yHLjYWxYIT4ea5py/jSWG4U3CFcdVJlZRpqI
 QZhdxgjvaUf1Q==
Date: Tue, 14 Oct 2025 01:02:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gem: fix typo in comment (I915_EXEC_NO_RELOC)
Message-ID: <6webdloh6nioeywpsp5kmerqmckc76mbhfc4lwygyvona5gn67@bmmcsfuqcjtm>
References: <20251013183123.438573-1-marlonsanches@estudante.ufscar.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013183123.438573-1-marlonsanches@estudante.ufscar.br>
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

Hi Marlon,

On Mon, Oct 13, 2025 at 03:31:23PM -0300, Marlon Henrique Sanches wrote:
> The comment referenced the flag name incorrectly as 'I915_EXEC_NORELOC'
> (missing underscore). This patch corrects the spelling in the comment
> only; there is no functional change.
> 
> Signed-off-by: Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
