Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F64CC61DE2
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 06:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B9C10E1ED;
	Mon, 31 Aug 2026 06:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oB2O0rTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3923A10E1ED
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788158078; x=1819694078;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QPtiJQzGldeofVfYRdgZmiDMN9d80s7B3m08r9GFiqM=;
 b=oB2O0rTLUZlX/oXnnkiObuoTjuLuR5Nniq/YwtGTTvP0471Myt6HbTm9
 nv8QksSUBBOKm0zBrQL7gYWV5Xeb+u3LpiY0ZggyDzul7wjpKMHlfpjAz
 ZWuYD0uqZyiXdJgdsv14LXV5gtARuWhy+LDfIYaLOVkoDcuyqY3KZrTuZ
 u+j7ePnumJscM0VpRCzgnBNlevOu03Euwhtbxrek50AAIcY13YYgariio
 F7r3/GEZ7FcsiVRILdyAZIrvO9Wf7jid/G+MoIio2qEEdTjAmkYkv823L
 +k3TxkY0xYMGKyqCDFB6CrSrp/1/8rb7f8u+N1CJBX9SCfJmEgzP46NA/ g==;
X-CSE-ConnectionGUID: y5yfFQJDTua751cQyHWnNg==
X-CSE-MsgGUID: GwyD9rLRSyuhSf6PQv5PvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="105930169"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="105930169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:34:38 -0700
X-CSE-ConnectionGUID: 8vniCwflRMyJOUEx7VF+nA==
X-CSE-MsgGUID: TySjLyIgRGqSo7QIrLfYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="267377594"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:34:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Shuangpeng Bai
 <shuangpeng.kernel@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Fix request use-after-free in heartbeat()
In-Reply-To: <apSwfmDiwsuyQT6I@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260808184302.1509585-1-shuangpeng.kernel@gmail.com>
 <apSwfmDiwsuyQT6I@zenone.zhora.eu>
Date: Mon, 31 Aug 2026 09:34:32 +0300
Message-ID: <1cabd39167ba04934dadbe0eb36c4adeaa702d4e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 31 Aug 2026, Andi Shyti <andi.shyti@kernel.org> wrote:
> I'm going to resend the patch so that it can be picked up by our CI.

Nowadays, there's no need to do that. It's possible to request retest in
patchwork.

BR,
Jani.

-- 
Jani Nikula, Intel
