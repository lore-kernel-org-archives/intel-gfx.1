Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67655C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 06:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3669F60F50
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 06:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3669F60F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57676E827;
	Fri, 22 Oct 2021 06:47:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBDF6E566;
 Fri, 22 Oct 2021 06:47:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="216155607"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="216155607"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:47:55 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="492436281"
Received: from ginagrec-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.48.36])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:47:54 -0700
Date: Thu, 21 Oct 2021 23:47:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, rodrigo.vivi@intel.com,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Message-ID: <20211022064752.zvrnyza34z6ggvut@ldmartin-desk2>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211021142627.31058-2-ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 01/17] drm/i915: Add has_64k_pages flag
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

On Thu, Oct 21, 2021 at 07:56:11PM +0530, Ramalingam C wrote:
>From: Stuart Summers <stuart.summers@intel.com>
>
>Add a new platform flag, has_64k_pages, for platforms supporting
>base page sizes of 64k.
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
