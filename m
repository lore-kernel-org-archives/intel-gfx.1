Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C2DC43334
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Jun 2022 10:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BF110EA75;
	Tue, 21 Jun 2022 10:30:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D814D10E757;
 Tue, 21 Jun 2022 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655807412; x=1687343412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hGPJv1wnfGiA7dhqB+qAJgXtYTSFtIVHY8tUxFioPGc=;
 b=SypV6CRXJiyQvKgBiXeNYcFSifQkkDt07xw7L/+Z1SoM65lZSd/m6S7b
 8MJ3EyhFj3wY72UntcAdOuuXmxVf4wVGNGxqW9tJSEL/4bnzAG5qf0lJx
 5ScMhgIZoAwhhzU1u+pmGlfDdnzIN9GrJiUFkHcD5LauhRjmwMng8NAyP
 ekF16BNbLymgWy6ueS16SHERbpZChdjhN6imQn8/9bQVhy606mjZfGsfP
 yt+S5Dwdg3EeRC4fxufl9LGq7k0nmkUPOG2hiIkC1xZVMl09l2xN9aMt6
 1vdVqv74lnFTe2T9iVeoFv0/Lt5qEMZiJH4L5/gQHUR0pc7L+QgqEdvHx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280816910"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="280816910"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:30:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="591596165"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:30:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 11:29:52 +0100
Message-Id: <20220621103001.184373-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t v2 0/9] small BAR uapi bits
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

-- 
2.36.1

