Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479FDCA0EE8
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Sep 2025 09:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D989810E3B6;
	Wed, 17 Sep 2025 09:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WFwcemY4";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD010E3B6
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Sep 2025 09:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A5B440631;
 Wed, 17 Sep 2025 09:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70F3C4CEF0;
 Wed, 17 Sep 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758099619;
 bh=8bvQLupDqFrUI2APAKcuxGywHMg3mgoLe3qeSNCmeQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFwcemY4Ep5j3E0CKgr6T6dEfeYs0of7dgQ4NMJmyXMN/VUaYoBrkFbP2atzDxBIG
 iK1udcxnbTQFGtUVHC1dzLvu2wz2cIIR44HqjEUwUQ/clSrzWq6SdyfYu18vPmGoYa
 wyfwLeZQ1Xdg8IAD1KblNk4kgWWS19D60ZxexHUw0/PhvcJFuU0zGTSKRw98Um4GQK
 tT821G8gkJ6xOVTc6RMWGY3Hx8fEwisenYHvXw0efhSULzjcuirtE6VKrrlSZGma+i
 47w5BQMqS8LxIBRy32q5iMcVU/TIuVxhGwhOLBNuITcCGPS0kJ/U9kzma97fS+ZhZP
 mX0M08avVjNAQ==
Date: Wed, 17 Sep 2025 11:00:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org, saurabhg.gupta@intel.com, 
 alex.zuo@intel.com
Subject: Re: [PATCH 2/2] drm/i915/gvt: Fix intel_vgpu_gpa_to_mmio_offset
 kernel docs
Message-ID: <itrhvlozcc6vypwevj7cr2xkzvboy4lcealri4xsqqxb4lprqn@7o5dl57ttisf>
References: <20250916174317.76521-4-jonathan.cavitt@intel.com>
 <20250916174317.76521-6-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916174317.76521-6-jonathan.cavitt@intel.com>
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

Hi Jonathan,

On Tue, Sep 16, 2025 at 05:43:20PM +0000, Jonathan Cavitt wrote:
> intel_vgpu_gpa_to_mmio_offset states that it returns
> 'Zero on success, negative error code if failed'
> in the kernel docs.
> 
> This is false.  The function actually returns
> 'The MMIO offset of the given GPA'.
> Correct the docs.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
