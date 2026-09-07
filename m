Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29590C79F9E
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 05:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BD610E452;
	Mon,  7 Sep 2026 05:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnCrkvH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9511F10E452
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788759086; x=1820295086;
 h=date:message-id:from:to:in-reply-to:references:subject;
 bh=tTC1fIxJXzIaAJ52NP3bo+aeFOCQocS63ZPKMcLiyq8=;
 b=GnCrkvH47UYv5Qx+q0YA3ptk5IKX2fYIW/JQ3tIU0NWoKm6PvVqRK2e6
 Cw7hkB3tzxrLPl8Arm4kwHhuXfkyqKq5QyPXybDjiu+yJoprm0cO7EsAU
 6C55ubLXlHxz68B5iXw1EWlLLptp53PuYCSGoPyg5Aq864QzgJcLyPMz0
 mp+bJZ1mTvREeZTXC7cESGyF2qc1dXynv43x/7Ay0gILaFulZxmAAQRvH
 d7goS+/Xdum/KYDOEuGpUn8n/A1wH+GxNULw85+G2ZUZa5a4ntOvGXdIj
 g0yml89F2QdcFidKWLypfUdetPJrvjFGE4CX8D1PGLgTtqQ4L7vNMHK11 Q==;
X-CSE-ConnectionGUID: 1QiXz+hpRneXF1HEkcigYA==
X-CSE-MsgGUID: 0d6szgj9Sau4RJISSDggzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100675949"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="100675949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:31:25 -0700
X-CSE-ConnectionGUID: oW4Ii30gRV2nWN3kTLK3UQ==
X-CSE-MsgGUID: 33p9uLJjTvOJcEVXJwJC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="270094666"
Received: from xiaolu.sh.intel.com (HELO localhost) ([10.239.146.103])
 by orviesa008.jf.intel.com with ESMTP; 06 Sep 2026 22:31:24 -0700
Date: Mon, 07 Sep 2026 13:28:57 +0800
Message-ID: <314b0dc2c8ddebfd995c83d0a04c715e.xiaolu.xie@intel.com>
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907043922.1367673-1-xiaolu.xie@intel.com>
References: <20260907043922.1367673-1-xiaolu.xie@intel.com>
Subject: Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
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

Superseded by v5 series:
<20260907044410.1368008-1-xiaolu.xie@intel.com>
