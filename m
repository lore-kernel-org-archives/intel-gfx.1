Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF129C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Dec 2021 09:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882946E9D0;
	Thu,  2 Dec 2021 09:02:28 +0000 (UTC)
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1917A6E9D0
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Dec 2021 09:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C65EC3F35C;
 Thu,  2 Dec 2021 10:02:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dD9rY3bnVOLo; Thu,  2 Dec 2021 10:02:20 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5AE0C3F240;
 Thu,  2 Dec 2021 10:02:18 +0100 (CET)
Received: from [192.168.0.209] (fmdmzpr02-ext.fm.intel.com [192.55.54.37])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 85850360B69;
 Thu,  2 Dec 2021 10:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638435738; bh=e/WH/kXYsFwQ798IZLMVF1wplbkLi8d2EsRG+EvGKjM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=UGnvDOf0H1dMQDQHDwBjKybkNUBJ6/V3DVi+qUHcPDzKgqgMtYuYFCfnFgK1qNJiu
 s6etTeEPgfHO+AkcohehhWgfgWlU+OsODhp/X2qUak3nppntKGYVmf5b7WFigyG7Kq
 X4LpuENPjDpOL6LgtCpdX1YWU/EJvEpD6wKUpzG0=
Message-ID: <ad910125-de32-3a35-d1a5-1ff9cecc7e97@shipmail.org>
Date: Thu, 2 Dec 2021 10:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Pallavi Mishra <pallavi.mishra@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211202043849.40094-1-pallavi.mishra@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20211202043849.40094-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH 0/1] static analysis failure
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

Hi,

On 12/2/21 05:38, Pallavi Mishra wrote:
> fix for null ptr dereferences
>
> Pallavi Mishra (1):
>    static analysis failure

No need for cover letter for a single patch.

>
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 3 +++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
