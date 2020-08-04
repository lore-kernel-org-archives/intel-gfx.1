Return-Path: <SRS0=l5Yo=BO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F8C433DF
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Aug 2020 06:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0339420781
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Aug 2020 06:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0339420781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2724C6E428;
	Tue,  4 Aug 2020 06:14:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA96E426;
 Tue,  4 Aug 2020 06:14:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8F2CAEFE;
 Tue,  4 Aug 2020 06:14:22 +0000 (UTC)
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-5-andr2000@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <90b215cb-c878-340e-402a-7739ba17e4a7@suse.com>
Date: Tue, 4 Aug 2020 08:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731125109.18666-5-andr2000@gmail.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 4/6] xen: Sync up with the canonical
 protocol definition in Xen
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 31.07.20 14:51, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is the sync up with the canonical definition of the
> display protocol in Xen.
> 
> 1. Add protocol version as an integer
> 
> Version string, which is in fact an integer, is hard to handle in the
> code that supports different protocol versions. To simplify that
> also add the version as an integer.
> 
> 2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE
> 
> There are cases when display data buffer is created with non-zero
> offset to the data start. Handle such cases and provide that offset
> while creating a display buffer.
> 
> 3. Add XENDISPL_OP_GET_EDID command
> 
> Add an optional request for reading Extended Display Identification
> Data (EDID) structure which allows better configuration of the
> display connectors over the configuration set in XenStore.
> With this change connectors may have multiple resolutions defined
> with respect to detailed timing definitions and additional properties
> normally provided by displays.
> 
> If this request is not supported by the backend then visible area
> is defined by the relevant XenStore's "resolution" property.
> 
> If backend provides extended display identification data (EDID) with
> XENDISPL_OP_GET_EDID request then EDID values must take precedence
> over the resolutions defined in XenStore.
> 
> 4. Bump protocol version to 2.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
